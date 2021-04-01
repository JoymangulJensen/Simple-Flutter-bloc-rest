// equatable: Package qui permet des comparaisons entre objets sans avoir à remplacer l' ==opérateur
import 'package:equatable/equatable.dart';
/*
CO2 backend Model attributes
*   co2_id: int
    co2_lib: str
    value: float
    unity: str
    measure_date:  datetime.date
    measure_time:  datetime.time
    creation_date:  datetime.date
    creation_time:  datetime.time
    experience_id: int
    materiel_id: int
* */
class Co2 extends Equatable {
  final int co2Id;
  final String co2Lib;
  final double value;
  final String unity;
  final DateTime measureDate;
  final DateTime measureTime;
  final DateTime creationDate;
  final DateTime creationTime;
  final int experienceId;
  final int materielId;


  const Co2({
    this.co2Id,
    this.co2Lib,
    this.value,
    this.unity,
    this.measureDate,
    this.measureTime,
    this.creationDate,
    this.creationTime,
    this.experienceId,
    this.materielId
  });

  @override
  List<Object> get props => [
    co2Id,
    co2Lib,
    value,
    unity,
    measureDate,
    measureTime,
    creationDate,
    creationTime,
    experienceId,
    materielId
  ];

  // Mapping between JSON response object and our model Co2
  static Co2 fromJson(dynamic json) {
    return Co2(
      co2Id :json['co2_id'] as int,
      co2Lib :json['co2_lib'] as String,
      value :json['value'] as double,
      unity :json['unity'] as String,
      measureDate : json['measure_date'] as DateTime,
      measureTime :json['measure_time'] as DateTime,
      creationDate :json['creation_date'] as DateTime,
      creationTime:json['creation_time'] as DateTime,
      experienceId :json['experience_id'] as int,
      materielId:json['materiel_id'] as int
    );
  }


}