// To parse this JSON data, do
//
//     final coursePreferenceModel = coursePreferenceModelFromJson(jsonString);

import 'dart:convert';

CoursePreferenceModel coursePreferenceModelFromJson(String str) => CoursePreferenceModel.fromJson(json.decode(str));

String coursePreferenceModelToJson(CoursePreferenceModel data) => json.encode(data.toJson());

class CoursePreferenceModel {
  String? message;
  List<CoursePreferenceData>? data;

  CoursePreferenceModel({
    this.message,
    this.data,
  });

  factory CoursePreferenceModel.fromJson(Map<String, dynamic> json) => CoursePreferenceModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<CoursePreferenceData>.from(json["data"]!.map((x) => CoursePreferenceData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CoursePreferenceData {
  int? id;
  String? countryName;
  String? studyLevel;
  String? duration;
  String? courseName;
  String? universityName;
  String? intake;
  String? intakeYear;
  String? addedBy;

  CoursePreferenceData({
    this.id,
    this.countryName,
    this.studyLevel,
    this.duration,
    this.courseName,
    this.universityName,
    this.intake,
    this.intakeYear,
    this.addedBy,
  });

  factory CoursePreferenceData.fromJson(Map<String, dynamic> json) => CoursePreferenceData(
    id: json["id"],
    countryName: json["country_name"],
    studyLevel: json["study_level"],
    duration: json["duration"],
    courseName: json["course_name"],
    universityName: json["university_name"],
    intake: json["intake"],
    intakeYear: json["intake_year"],
    addedBy: json["added_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_name": countryName,
    "study_level": studyLevel,
    "duration": duration,
    "course_name": courseName,
    "university_name": universityName,
    "intake": intake,
    "intake_year": intakeYear,
    "added_by": addedBy,
  };
}
