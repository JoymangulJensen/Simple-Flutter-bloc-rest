import 'dart:async';

import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/patient/patient_api_client.dart';

class PatientRepository {
  final PatientApiClient patientApiClient;

  PatientRepository({@required this.patientApiClient})
      : assert(patientApiClient != null);

  Future<Patient> fetchPatient({@required int id}) async {
    return await patientApiClient.getPatient(id);
  }

  Future<List<Patient>> fetchPatientsList() async {
    return await patientApiClient.getPatientsList();
  }
}
