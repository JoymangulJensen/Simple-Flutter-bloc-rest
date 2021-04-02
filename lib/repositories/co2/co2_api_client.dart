import 'package:poc_fo/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Co2ApiClient {
  static const baseUrl = 'http://10.0.2.2:5000/co2';
  final http.Client httpClient;

  Co2ApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);


  // method to get one co2 by id
  Future<Co2> getCo2ById(int id) async {
    final response = await http.Client().get(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 200)
      throw new Exception('error getting co2 data for id $id');
    return parseCo2(response.body);
  }

  // method to get co2 data list
  Future<List<Co2>> getCo2List() async {
    final response = await http.Client().get(Uri.parse("$baseUrl"));
    //print(response);
    if (response.statusCode != 200)
      throw new Exception('error getting co2 list data');
    return parseCo2s(response.body);
  }

  List<Co2> parseCo2s(String responseBody) {
    final jsonDecoded = jsonDecode(responseBody);
    final parsed = jsonDecoded.cast<Map<String, dynamic>>();
    return parsed.map<Co2>((json) => Co2.fromJson(json)).toList();
  }

  Co2 parseCo2(final response) {
    final jsonDecoded = json.decode(response);
    return Co2.fromJson(jsonDecoded);
  }




}