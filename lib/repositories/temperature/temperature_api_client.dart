import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http ;
import 'package:poc_fo/models/models.dart';

class TemperatureApiClient {
  static const baseUrl = 'http://10.0.2.2:5000/temperature';
  final http.Client httpClient;

  TemperatureApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);


  Future<Temperature> getData() async {
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode != 200) {
      throw Exception('error getting data');
    }
    final decoded =json.decode(response.body);
    return Temperature.fromJson(decoded);

  }
}