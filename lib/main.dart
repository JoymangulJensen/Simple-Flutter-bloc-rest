import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poc_fo/blocs/blocs.dart';
import 'package:poc_fo/repositories/repositories.dart';
import 'package:poc_fo/repositories/noise/noise_api_client.dart';
import 'package:poc_fo/repositories/noise/noise_repository.dart';

import 'package:poc_fo/repositories/temperature/temperature_api_client.dart';
import 'package:poc_fo/repositories/temperature/temperature_repository.dart';

import 'package:poc_fo/views/show_temperature.dart';


import 'blocs/temperature/temperature_bloc.dart';
import 'models/Temperature.dart';
import 'utils/simple_observer_bloc.dart';
import 'blocs/blocs.dart';

import 'package:poc_fo/repositories/co2/co2_api_client.dart';
import 'package:poc_fo/repositories/co2/co2_repository.dart';
import 'package:poc_fo/models/models.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poc_fo/blocs/blocs.dart';
import 'package:poc_fo/repositories/repositories.dart';
import 'package:poc_fo/views/display_co2.dart';
import 'package:poc_fo/repositories/noise/noise_api_client.dart';
import 'package:poc_fo/repositories/noise/noise_repository.dart';
import 'package:http/http.dart' as http;

import 'utils/bloc_observer.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  final PatientRepository patientRepository = PatientRepository(
    patientApiClient: PatientApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(repository: patientRepository));
}
class MyApp extends StatelessWidget {

  final TemperatureRepository temperatureRepository;

  const MyApp({Key key, this.temperatureRepository})
      : assert(temperatureRepository != null),
  final Co2Repository repository;
  MyApp({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        home: MultiBlocProvider(providers: [
          BlocProvider<TemperatureBloc>(
            create: (context) => TemperatureBloc(temperatureRepository: temperatureRepository),
          )
        ], child: ShowTemperature()
          ),


      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          child: ShowPatient()),
    );
        title: 'POC DEMO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider<Co2Bloc>(
            create: (context) => Co2Bloc(co2Repository: repository),
          )
        ], child: ShowPatient()));
  }
}
