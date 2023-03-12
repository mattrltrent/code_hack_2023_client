import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:client/constants.dart';
import 'package:client/entity/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'patient_data_state.dart';

class PatientDataCubit extends Cubit<PatientDataState> {
  PatientDataCubit() : super(Loading());

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
