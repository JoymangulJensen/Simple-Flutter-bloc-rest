import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Noise extends Equatable {
  final String measureDate;
  final String measureTime;
  final int noiseId;
  final String noiseLib;
  final String unity;
  final double value;

  Noise(
      {this.measureDate,
      this.measureTime,
      this.noiseId,
      this.noiseLib,
      this.unity,
      this.value});

  static Noise fromJson(Map<String, dynamic> json) {
    return Noise(
        measureDate: json['measure_date'],
        measureTime: json['measure_time'],
        noiseId: json['noise_id'],
        noiseLib: json['noise_lib'],
        unity: json['unity'],
        value: json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['measure_date'] = this.measureDate;
    data['measure_time'] = this.measureTime;
    data['noise_id'] = this.noiseId;
    data['noise_lib'] = this.noiseLib;
    data['unity'] = this.unity;
    data['value'] = this.value;
    return data;
  }

  @override
  List<Object> get props =>
      [noiseId, noiseLib, unity, value, measureTime, measureDate];

  @override
  bool get stringify => true;
}
