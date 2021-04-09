import 'package:flutter/material.dart';
import 'package:poc_fo/repositories/noise/noise_api_client.dart';
import 'package:poc_fo/repositories/noise/noise_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_fo/repositories/temperature/temperature_api_client.dart';
import 'package:poc_fo/repositories/temperature/temperature_repository.dart';
import 'package:poc_fo/views/show_temperature.dart';


import 'blocs/temperature/temperature_bloc.dart';
import 'models/Temperature.dart';
import 'models/Temperature.dart';
import 'repositories/temperature/temperature_repository.dart';
import 'utils/simple_observer_bloc.dart';
import 'blocs/blocs.dart';


void main() {
  Bloc.observer = SimpleBlocObserver();

  final TemperatureRepository temperatureRepository = TemperatureRepository(
    temperatureAPIClient: TemperatureApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(temperatureRepository: temperatureRepository));
}

class MyApp extends StatelessWidget {

  final TemperatureRepository temperatureRepository;

  const MyApp({Key key, this.temperatureRepository})
      : assert(temperatureRepository != null),
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
    );
  }
}
