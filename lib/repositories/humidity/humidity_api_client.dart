import 'package:poc_fo/models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HumidityApiClient {
  static const baseUrl = 'http://10.0.2.2:5000/humidity';
  final http.Client httpClient;

  HumidityApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);



  Future<Humidity> getHumidityById(int humidityId) async {

    final response = await http.Client().get(Uri.parse("$baseUrl/$humidityId"));
    if (response.statusCode != 200)
      throw new Exception('error getting Humidity data for id $humidityId');
    print(response.body);
    return parseHumidities(response.body);
  }


  Humidity parseHumidities(final response) {
    final jsonDecoded = json.decode(response);
    return Humidity.fromJson(jsonDecoded);
  }

  //Future<List<Humidity>> GetHumidityListt() async {
   // List<Humidity> humiditylist = await humidityApiClient.getHumidityList();
   // humiditylist.forEach((element) {
     // print(element.toJson());
   // });
   // return humiditylist;
  //}++

  //headers: keep-Alive
  Future<List<Humidity>> getHumidityList() async {
    final response = await http.Client().get(Uri.parse("$baseUrl"));
    print(response);
    if (response.statusCode != 200)
      throw new Exception('error getting Humidity list data');
    return parseHumidity(response.body);
  }
  ///Future<List<Humidity>> getHumidityList() async {
  //  final response = await http.Client().get(Uri.parse("$baseUrl"));

   // if (response.statusCode != 200) {
    //  throw new Exception('error getting quotes');
   // }

    //final json = jsonDecode(response.body);
   // return parseHumidity(response.body);
  //}

  List<Humidity> parseHumidity(String responseBody) {
    final jsonDecoded = jsonDecode(responseBody);
    final parsed = jsonDecoded.cast<Map<String, dynamic>>();
    return parsed.map<Humidity>((json) => Humidity.fromJson(json)).toList();
  }






}