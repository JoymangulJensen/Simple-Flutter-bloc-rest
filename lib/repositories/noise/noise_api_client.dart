import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:poc_fo/models/models.dart';

class NoiseApiClient {
  static const baseUrl = 'http://10.0.2.2:5000/noise';
  final http.Client httpClient;

  NoiseApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Noise> fetchNoise(int id) async {
    final response = await http.Client().get(Uri.parse("$baseUrl/$id"));
    //print((response.body);
    if (response.statusCode != 200) throw new Exception('error getting data');
    return parseNoise(response.body);
  }

  Future<List<Noise>> fetchNoises() async {
    final response = await http.Client().get(Uri.parse("$baseUrl"));
    //print(response);
    if (response.statusCode != 200)
      throw new Exception('error getting co2 list data');
    return parseNoises(response.body);
  }

  List<Noise> parseNoises(String responseBody) {
    final jsonDecoded = jsonDecode(responseBody);
    final parsed = jsonDecoded.cast<Map<String, dynamic>>();
    return parsed.map<Noise>((json) => Noise.fromJson(json)).toList();
  }

  Noise parseNoise(String responseBody) {
    final jsonDecoded = json.decode(responseBody);
    return Noise.fromJson(jsonDecoded);
  }
}
