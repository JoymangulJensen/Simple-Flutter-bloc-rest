part of 'patient_bloc.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();
}

class FetchPatient extends PatientEvent {
  final id;

  const FetchPatient({@required this.id});

  @override
  List<Object> get props => [id];
}

class EditPatient extends PatientEvent {
  final Patient patient;

  const EditPatient({@required this.patient});

  @override
  List<Object> get props => [patient];
}

class AddPatient extends PatientEvent {
  final Patient patient;

  const AddPatient({@required this.patient});

  @override
  List<Object> get props => [patient];
}

class DeletePatient extends PatientEvent {
  final id;

  const DeletePatient({@required this.id});

  @override
  List<Object> get props => [id];
}
