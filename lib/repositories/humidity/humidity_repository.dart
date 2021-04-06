import 'dart:async';
import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/humidity/humidity_api_client.dart';

class HumidityRepository {
  final HumidityApiClient humidityapiClient;

  HumidityRepository({@required this.humidityapiClient})
      : assert(humidityapiClient != null);

  Future<Humidity> GetOneHumidity({@required int id}) async {
    Humidity humidity = await humidityapiClient.getHumidityById(id);
    print(" humidity libelle: "+ humidity.humidityLib);
    return humidity;
  }

  Future<List<Humidity>> GetHumidityList() async {
    return await humidityapiClient.getHumidityList();
  }

}