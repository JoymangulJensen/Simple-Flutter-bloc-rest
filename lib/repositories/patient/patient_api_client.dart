import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';

class PatientApiClient {
  final _baseUrl = 'http://10.0.2.2:5000/patients';
  final http.Client httpClient;

  PatientApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Patient> getPatient(int id) async {
    final response = await http.Client().get(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 200)
      throw new Exception('error getting patient having id=$id');
    return parsePatient(response.body);
  }

  Patient parsePatient(final response) {
    final jsonDecoded = json.decode(response);
    return Patient.fromJson(jsonDecoded);
  }

  Future<List<Patient>> getPatientsList() async {
    final response = await http.Client().get(Uri.parse("$_baseUrl"));
    if (response.statusCode != 200)
      throw new Exception('error getting patients');
    return parsePatients(response.body);
  }

  List<Patient> parsePatients(String responseBody) {
    final jsonDecoded = jsonDecode(responseBody);
    final parsed = jsonDecoded.cast<Map<String, dynamic>>();
    return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
  }
}
