import 'dart:convert';

import 'package:client/entity/models.dart';
import 'package:intl/intl.dart';

import 'package:bloc/bloc.dart';
import 'package:client/constants.dart';
import 'package:client/entity/category.dart';
import 'package:client/entity/ups.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

part 'patient_data_state.dart';

class PatientDataCubit extends Cubit<PatientDataState> {
  PatientDataCubit() : super(Loading());

  // visit id
  Future<void> sendData(PatientDataState state) async {
    Map<String, bool> sendable_dateable = {};
    List results = [];
    if (state is Data) {
      final ups = state.ups!;
      for (Ups up in ups) {
        String name = state.categories.where((e) => e.id == up.id).first.name;
        results.add({name: true});
      }
      for (var result in results) {
        sendable_dateable.addAll(result);
      }
    }
    emit(Loading());
    String formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.now());
    http.Response response;
    try {
      response = await http
          .post(
            Uri.parse(sendDataEndpoint),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              "visitID": (Random().nextInt(900000) + 100000).toString(),
              "clinicID": (Random().nextInt(900000) + 100000).toString(),
              "accessTime": formattedDate,
              "clinicName": "Jubilee Hospital",
              "clinicLocation": "1234 Main Street, New York, NY 10001",
              "clinicPhone": "123-456-7890",
              "clinician": "Dr. John Smith",
              "clinicianSpecialty": "Cardiologist",
              "accessedInformation": sendable_dateable,
            }),
          )
          .timeout(const Duration(seconds: 3));
    } catch (err) {
      emit(Error());
      print("err :( $err");
      return;
    }
    print(response.statusCode);
  }

  void setUps(String id, bool value) {
    if (state is Data) {
      final data = state as Data;
      final ups = data.ups;
      final index = ups?.indexWhere((element) => element.id == id);
      if (index == -1) {
        ups?.add(Ups(id: id, isSelected: value));
      } else {
        if (value) {
          ups![index!] = Ups(id: id, isSelected: value);
        } else {
          ups!.removeAt(index!);
        }
      }
      emit(data.copyWith(ups: ups));
    }
  }

  Future<void> fetchAllData() async {
    emit(Loading());
    var url = Uri.parse('https://codehack-2023-server.christopherhuk1.repl.co/dummy/1/getInfo');
    try {
      var response = await http.get(url);
      final data = json.decode(response.body);
      final full_data = Model.fromJson(data);
      emit(FullData(model: full_data));
    } catch (err) {
      print("ERRRR: $err");
      emit(Error());
    }
  }

  Future<void> loadData(String name, String phn) async {
    emit(Loading());
    http.Response response;
    try {
      response = await http.get(Uri.parse(listEndpoint)).timeout(const Duration(seconds: 3));
    } catch (err) {
      emit(Error());
      return;
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<CategoryItem> items = [];
      try {
        final parsed = jsonData.cast<Map<String, dynamic>>();
        items = parsed.map<CategoryItem>((json) => CategoryItem.fromJson(json)).toList();
      } catch (err) {
        print("ERR: $err");
        emit(Error());
        return;
      }
      emit(Data(categories: items, name: name, phn: phn));
    } else {
      emit(Error());
    }
  }
}
