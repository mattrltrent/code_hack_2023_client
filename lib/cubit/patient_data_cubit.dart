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
    // await Future.delayed(const Duration(milliseconds: 250));
    final response = await http.get(Uri.parse(listEndpoint));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      try {
        final data = CategoryItem.fromJson(jsonData);
        print(data);
      } catch (e) {
        emit(Error());
        return;
      }
      emit(Data(categories: [], name: name, phn: phn));
    } else {
      emit(Error());
    }
    // Parse
  }
}
