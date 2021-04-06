import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  String birthday;
  String address;
  String createdAt;
  int lmdId;
  String name;
  String surname;
  int id;
  int trcrId;
  int trcId;
  String updatedAt;
  List<Experience> experiences;

  Patient(
      {this.id,
      this.name,
      this.surname,
      this.birthday,
      this.address,
      this.experiences,
      this.lmdId,
      this.trcrId,
      this.trcId,
      this.createdAt,
      this.updatedAt});

  @override
  // TODO: implement props
  List<Object> get props => [id];

  factory Patient.fromJson(Map<String, dynamic> json) {
    List<Experience> ex = [];
    if (json['experiences'] != null) {
      json['experiences'].forEach((v) {
        ex.add(new Experience.fromJson(v));
      });
    }
    return Patient(
        id: json['trc_patient_id'],
        name: json['name'],
        surname: json['surname'],
        birthday: json['birthday'],
        experiences: ex,
        lmdId: json['lmd_patient_id'],
        trcrId: json['trc_rendered_traitement_id'],
        trcId: json['trc_traitement_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['created_at'] = this.createdAt;
    data['lmd_patient_id'] = this.lmdId;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['trc_patient_id'] = this.id;
    data['trc_rendered_traitement_id'] = this.trcrId;
    data['trc_traitement_id'] = this.trcId;
    data['updated_at'] = this.updatedAt;
    if (this.experiences != null) {
      data['experiences'] = this.experiences.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Experience extends Equatable {
  String createdAt;
  int experienceId;
  String startDate;
  int trcPatientId;
  String updatedAt;

  Experience(
      {this.trcPatientId,
      this.experienceId,
      this.createdAt,
      this.startDate,
      this.updatedAt});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
        trcPatientId: json['trc_patient_id'],
        experienceId: json['experience_id'],
        createdAt: json['created_at'],
        startDate: json['start_date'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['experience_id'] = this.experienceId;
    data['start_date'] = this.startDate;
    data['trc_patient_id'] = this.trcPatientId;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [experienceId];
}
