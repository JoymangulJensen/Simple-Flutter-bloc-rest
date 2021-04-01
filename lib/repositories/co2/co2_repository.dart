import 'dart:async';
import 'package:meta/meta.dart';
import 'package:poc_fo/models/models.dart';
import 'package:poc_fo/repositories/co2/co2_api_client.dart';

class Co2Repository {
  final Co2ApiClient co2apiClient;

  Co2Repository({@required this.co2apiClient})
      : assert(co2apiClient != null);

  Future<Co2> GetOneCo2({@required int id}) async {
    return await co2apiClient.getCo2ById(id);
  }

  Future<List<Co2>> GetCo2List() async {
    return await co2apiClient.getCo2List();
  }
}