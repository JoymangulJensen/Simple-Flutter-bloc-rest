import 'package:flutter/cupertino.dart';
import 'package:poc_fo/models/models.dart';
import 'package:equatable/equatable.dart';

@immutable
class Humidity extends Equatable{
  String creationDate;
  String creationTime;
  int experienceId;
  int humidityId;
  String humidityLib;
  int materielId;
  String measureDate;
  String measureTime;
  String unity;
  int value;

  Humidity(
      {this.creationDate,
        this.creationTime,
        this.experienceId,
        this.humidityId,
        this.humidityLib,
        this.materielId,
        this.measureDate,
        this.measureTime,
        this.unity,
        this.value});

  @override
  List<Object> get props => [
    creationDate,
    creationTime,
    experienceId,
    humidityId,
    humidityLib,
    materielId,
    measureDate,
    measureTime,
    unity,
    value
  ];



  factory Humidity.fromJson(Map<String, dynamic> json) {
    return Humidity(
        creationDate : json['creationDate'],
        creationTime: json['creationTime'],
        experienceId : json['experienceId'],
        humidityId : json['humidityId'],
        humidityLib : json['humidityLib'],
        materielId : json['materielId'],
        measureDate : json['measureDate'],
        measureTime : json['measureTime'],
        unity : json['unity'],
        value : json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creationDate']=this.creationDate;
    data['creationTime']=this.creationTime;
    data['experienceId']=this.experienceId;
    data['humidityId']=this.humidityId;
    data['humidityLib']=this.humidityLib;
    data['materielId']=this.materielId;
    data['measureDate']=this.measureDate;
    data['measureTime']=this.measureTime;
    data['unity']=this.unity;
    data['value']= this.value;
    return data;
  }


}



