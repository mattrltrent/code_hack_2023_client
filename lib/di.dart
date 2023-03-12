import 'package:client/cubit/patient_data_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PatientDataCubit());
}
