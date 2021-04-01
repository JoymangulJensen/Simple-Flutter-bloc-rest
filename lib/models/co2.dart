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
class Co2 {
  int co2Id;
  String co2Lib;
  String creationDate;
  String creationTime;
  int experienceId;
  int materielId;
  String measureDate;
  String measureTime;
  String unity;
  double value;

  Co2({
        this.co2Id,
        this.co2Lib,
        this.creationDate,
        this.creationTime,
        this.experienceId,
        this.materielId,
        this.measureDate,
        this.measureTime,
        this.unity,
        this.value
      });

  List<Object> get props => [
    co2Id,
    co2Lib,
    creationDate,
    creationTime,
    experienceId,
    materielId,
    measureDate,
    measureTime,
    unity,
    value
  ];

  Co2.fromJson(Map<String, dynamic> json) {
    co2Id = json['co2_id'] as int;
    co2Lib = json['co2_lib'] as String;
    creationDate = json['creation_date'] as String;
    creationTime = json['creation_time'] as String;
    experienceId = json['experience_id'] as int;
    materielId = json['materiel_id'] as int;
    measureDate = json['measure_date'] as String;
    measureTime = json['measure_time'] as String;
    unity = json['unity'] as String;
    value = json['value'] as double;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co2_id'] = this.co2Id;
    data['co2_lib'] = this.co2Lib;
    data['creation_date'] = this.creationDate;
    data['creation_time'] = this.creationTime;
    data['experience_id'] = this.experienceId;
    data['materiel_id'] = this.materielId;
    data['measure_date'] = this.measureDate;
    data['measure_time'] = this.measureTime;
    data['unity'] = this.unity;
    data['value'] = this.value;
    return data;
  }
}