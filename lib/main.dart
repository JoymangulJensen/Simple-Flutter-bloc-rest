import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:poc_fo/blocs/blocs.dart';
import 'package:poc_fo/utils/simple_observer_bloc.dart';
import 'package:poc_fo/views/views.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<Co2Bloc>(
      create: (BuildContext context) => Co2Bloc(
        co2Repository: Co2Repository(
          co2apiClient: Co2ApiClient(
            httpClient: http.Client(),
          ),
        ),
      ),
    ),
    BlocProvider<PatientBloc>(
      create: (BuildContext context) => PatientBloc(
        repository: PatientRepository(
          patientApiClient: PatientApiClient(
            httpClient: http.Client(),
          ),
        ),
      ),
    ),
    BlocProvider<HumidityBloc>(
      create: (BuildContext context) => HumidityBloc(
        humidityRepository: HumidityRepository(
          humidityapiClient: HumidityApiClient(
            httpClient: http.Client(),
          ),
        ),
      ),
    ),
    BlocProvider<TemperatureBloc>(
      create: (BuildContext context) => TemperatureBloc(
        temperatureRepository: TemperatureRepository(
          temperatureAPIClient: TemperatureApiClient(
            httpClient: http.Client(),
          ),
        ),
      ),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DIH4CPS',
      routes: {
        '/patient': (context) => ShowPatient(),
        '/co2': (context) => ShowCO2(),
        '/humidity': (context) => HumidityView(),
        '/temperature': (context) => ShowTemperature(),
      },
      initialRoute: '/patient',
    );
  }
}
