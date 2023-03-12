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

  List<Ups>? ups;
  final String name;
  final String phn;
  final List<CategoryItem> categories;

  Data({required this.categories, required this.name, required this.phn, this.ups}) {
    ups = [];
  }

  Data copyWith({List<Ups>? ups, String? name, String? phn, List<CategoryItem>? categories}) {
    return Data(
      ups: ups ?? this.ups,
      name: name ?? this.name,
      phn: phn ?? this.phn,
      categories: categories ?? this.categories,
    );
  }
}

class Error extends PatientDataState {
  @override
  List<Object?> get props => [];
}

class FullData extends PatientDataState {
  @override
  List<Object?> get props => [];

  FullData();
}
