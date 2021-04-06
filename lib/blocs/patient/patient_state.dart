part of 'patient_bloc.dart';

abstract class PatientState extends Equatable {
  const PatientState();
}

class PatientInitial extends PatientState {
  @override
  List<Object> get props => [];
}

class PatientLoadInProgress extends PatientState {
  @override
  List<Object> get props => [];
}

class PatientLoadSuccess extends PatientState {
  final Patient patient;

  const PatientLoadSuccess({@required this.patient}) : assert(patient != null);

  @override
  List<Object> get props => [patient];
}

class PatientLoadFailure extends PatientState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
