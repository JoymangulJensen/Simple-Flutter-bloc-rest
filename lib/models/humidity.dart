import 'package:flutter/cupertino.dart';
import 'package:poc_fo/models/models.dart';
import 'package:equatable/equatable.dart';

@immutable
class Humidity extends Equatable{
 final String creationDate;
 final String creationTime;
 final int experienceId;
 final int humidityId;
 final String humidityLib;
 final int materielId;
 final String measureDate;
 final  String measureTime;
 final String unity;
 final double value;

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
        creationDate : json['creation_date'],
        creationTime: json['creation_time'],
        experienceId : json['experience_id'],
        humidityId : json['humidity_id'],
        humidityLib : json['humidity_lib'],
        materielId : json['materiel_id'],
        measureDate : json['measure_date'],
        measureTime : json['measure_time'],
        unity : json['unity'],
        value : json['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creation_date']=this.creationDate;
    data['creation_time']=this.creationTime;
    data['experience_id']=this.experienceId;
    data['humidity_id']=this.humidityId;
    data['humidity_lib']=this.humidityLib;
    data['materiel_id']=this.materielId;
    data['measure_date']=this.measureDate;
    data['measure_time']=this.measureTime;
    data['unity']=this.unity;
    data['value']= this.value;
    return data;
  }
  @override
  String toString() {
    return 'Humidity{creationDate: $creationDate, creationTime:$creationTime,experienceId: $experienceId, humidityId:$humidityId, '
        'humidityLib: $humidityLib,materielId: $materielId, measureDate:$measureDate, measureTime:$measureTime, unity: $unity, value:$value }';
  }

}



