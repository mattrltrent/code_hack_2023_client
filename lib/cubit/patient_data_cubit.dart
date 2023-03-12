import 'package:bloc/bloc.dart';
import 'package:client/entity/category.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'patient_data_state.dart';

class PatientDataCubit extends Cubit<PatientDataState> {
  PatientDataCubit() : super(Loading());

  Future<void> loadData(String name, String phn) async {
    emit(Loading());
    await Future.delayed(const Duration(milliseconds: 250));
    emit(Data(categories: [], name: name, phn: phn));
  }
}
