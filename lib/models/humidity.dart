class humidity {
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

  humidity(
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

  humidity.fromJson(Map<String, dynamic> json) {
    creationDate = json['creation_date'];
    creationTime = json['creation_time'];
    experienceId = json['experience_id'];
    humidityId = json['humidity_id'];
    humidityLib = json['humidity_lib'];
    materielId = json['materiel_id'];
    measureDate = json['measure_date'];
    measureTime = json['measure_time'];
    unity = json['unity'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creation_date'] = this.creationDate;
    data['creation_time'] = this.creationTime;
    data['experience_id'] = this.experienceId;
    data['humidity_id'] = this.humidityId;
    data['humidity_lib'] = this.humidityLib;
    data['materiel_id'] = this.materielId;
    data['measure_date'] = this.measureDate;
    data['measure_time'] = this.measureTime;
    data['unity'] = this.unity;
    data['value'] = this.value;
    return data;
  }
}