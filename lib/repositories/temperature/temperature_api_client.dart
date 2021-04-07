import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:poc_fo/models/models.dart';

class TemperatureApiClient {
  static const baseUrl = 'http://10.0.2.2:5000/temperature';
  final http.Client httpClient;

  TemperatureApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);


  Future<Temperature> getTemperature(int id) async {
    final response = await http.Client().get(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 200)
      throw new Exception('error getting temperature having id=$id');
    return parseTemperature(response.body);
  }

  Temperature parseTemperature(final response) {
    final jsonDecoded = json.decode(response);
    return Temperature.fromJson(jsonDecoded);
  }
}
