part of 'patient_data_cubit.dart';

@immutable
abstract class PatientDataState extends Equatable {}

class PatientDataInitial extends PatientDataState {
  @override
  List<Object?> get props => [];
}

class Loading extends PatientDataState {
  @override
  List<Object?> get props => [];
}

class Data extends PatientDataState {
  @override
  List<Object?> get props => [];

  final String name;
  final String phn;
  final List<CategoryItem> categories;

  Data({required this.categories, required this.name, required this.phn});
}
