import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


class Temperature extends Equatable {

  int temperatureId;
  String dateMaxTemp;
  String dateMinTemp;
  double maxTemp;
  String maxTempLib;
  String measureDate;
  String measureTime;
  double minTemp;
  String minTempLib;
  String temperatureLib;
  String timeMaxTemp;
  String timeMinTemp;
  String unity;
  double value;

  Temperature (
      {
        this.dateMaxTemp,
        this.dateMinTemp,
        this.maxTemp,
        this.maxTempLib,
        this.measureDate,
        this.measureTime,
        this.minTemp,
        this.minTempLib,
        this.temperatureId,
        this.temperatureLib,
        this.timeMaxTemp,
        this.timeMinTemp,
        this.unity,
        this.value
      }
      );

  @override
  // TODO: implement props
  List<Object> get props => [
    temperatureId,
    dateMaxTemp,
    dateMinTemp,
    maxTemp,
    maxTempLib,
    measureDate,
    measureTime,
    minTemp,
    minTempLib,
    temperatureLib,
    timeMaxTemp,
    timeMinTemp,
    unity,
    value,
  ];


  Temperature.fromJson(Map<String, dynamic> json) {
    dateMaxTemp = json['date_max_temp'];
    dateMinTemp = json['date_min_temp'];
    maxTemp = json['max_temp'];
    maxTempLib = json['max_temp_lib'];
    measureDate = json['measure_date'];
    measureTime = json['measure_time'];
    minTemp = json['min_temp'];
    minTempLib = json['min_temp_lib'];
    temperatureId = json['temperature_id'];
    temperatureLib = json['temperature_lib'];
    timeMaxTemp = json['time_max_temp'];
    timeMinTemp = json['time_min_temp'];
    unity = json['unity'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_max_temp'] = this.dateMaxTemp;
    data['date_min_temp'] = this.dateMinTemp;
    data['max_temp'] = this.maxTemp;
    data['max_temp_lib'] = this.maxTempLib;
    data['measure_date'] = this.measureDate;
    data['measure_time'] = this.measureTime;
    data['min_temp'] = this.minTemp;
    data['min_temp_lib'] = this.minTempLib;
    data['temperature_id'] = this.temperatureId;
    data['temperature_lib'] = this.temperatureLib;
    data['time_max_temp'] = this.timeMaxTemp;
    data['time_min_temp'] = this.timeMinTemp;
    data['unity'] = this.unity;
    data['value'] = this.value;
    return data;
  }
}