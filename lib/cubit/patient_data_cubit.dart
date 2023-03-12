import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'patient_data_state.dart';

class PatientDataCubit extends Cubit<PatientDataState> {
  PatientDataCubit() : super(PatientDataInitial());
}
