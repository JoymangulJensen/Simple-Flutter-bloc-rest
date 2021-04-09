import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'utils/bloc_observer.dart';
import 'package:poc_fo/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_fo/views/views.dart';

import 'package:poc_fo/blocs/blocs.dart';
import 'package:poc_fo/repositories/repositories.dart';
import 'package:poc_fo/views/show_patient.dart';
import 'package:poc_fo/repositories/noise/noise_api_client.dart';
import 'package:poc_fo/repositories/noise/noise_repository.dart';
void main() {
  Bloc.observer = HuBlocObserver();
  final HumidityRepository humidityRepository = HumidityRepository(
    humidityapiClient: HumidityApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(humidityRepository: humidityRepository));
}

import 'package:poc_fo/repositories/temperature/temperature_api_client.dart';
import 'package:poc_fo/repositories/temperature/temperature_repository.dart';

 class MyApp extends StatelessWidget {
  final HumidityRepository humidityRepository;
  MyApp({Key key, @required this.humidityRepository})
    : assert(humidityRepository != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    humidityRepository.GetOneHumidity(humidityId:3);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context)=>
        HumidityBloc(humidityRepository: humidityRepository),
        child: HumidityView(),
      ),
    );
  }
}

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
import 'utils/bloc_observer.dart';

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
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PatientBloc(repository: repository),
          ),
           BlocProvider<Co2Bloc>(
            create: (context) => Co2Bloc(co2Repository: repository),
          ),
           BlocProvider<TemperatureBloc>(
            create: (context) => TemperatureBloc(temperatureRepository: temperatureRepository),
          )
        ],
        child: ShowPatient(),
      ),
    );
  }
}
// child: ShowPatient()));
  }
}
