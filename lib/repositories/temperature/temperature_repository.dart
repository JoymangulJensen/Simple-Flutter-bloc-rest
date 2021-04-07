import 'dart:async';
import 'package:meta/meta.dart';
import 'package:poc_fo/models/Temperature.dart';
import 'package:poc_fo/repositories/repositories.dart';
import 'package:poc_fo/repositories/temperature/temperature_api_client.dart';

class TemperatureRepository {
  final TemperatureApiClient temperatureAPIClient;

  TemperatureRepository({@required this.temperatureAPIClient})
      : assert(temperatureAPIClient != null);

  Future<Temperature> fetchTemperature({@required int id}) async {
   // Temperature temp =
   // print(temp.toJson());
    return await temperatureAPIClient.getTemperature(id);;
  }
  }

