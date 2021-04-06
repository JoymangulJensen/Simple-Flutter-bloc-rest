import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/repositories.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final PatientRepository repository;
  PatientBloc({@required this.repository})
      : assert(repository != null),
        super(PatientInitial());

  @override
  Stream<PatientState> mapEventToState(
    PatientEvent event,
  ) async* {
    if (event is FetchPatient) {
      yield PatientLoadInProgress();
      try {
        final Patient patient = await repository.fetchPatient(id: event.id);
        yield PatientLoadSuccess(patient: patient);
      } catch (_) {
        yield PatientLoadFailure();
      }
    }
  }
}
