// To parse this JSON data, do
//
//     final sortListedCourseModel = sortListedCourseModelFromJson(jsonString);

import 'dart:convert';

SortListedCourseModel sortListedCourseModelFromJson(String str) => SortListedCourseModel.fromJson(json.decode(str));

String sortListedCourseModelToJson(SortListedCourseModel data) => json.encode(data.toJson());

class SortListedCourseModel {
  String? message;
  List<SortListedCourse>? data;

  SortListedCourseModel({
    this.message,
    this.data,
  });

  factory SortListedCourseModel.fromJson(Map<String, dynamic> json) => SortListedCourseModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<SortListedCourse>.from(json["data"]!.map((x) => SortListedCourse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SortListedCourse {
  int? bookmarkId;
  String? duration;
  String? intakes;
  String? courseName;
  int? university;
  String? studyLevel;
  String? campus;
  String? universityName;
  String? country;
  DateTime? createdAt;

  SortListedCourse({
    this.bookmarkId,
    this.duration,
    this.intakes,
    this.courseName,
    this.university,
    this.studyLevel,
    this.campus,
    this.universityName,
    this.country,
    this.createdAt,
  });

  factory SortListedCourse.fromJson(Map<String, dynamic> json) => SortListedCourse(
    bookmarkId: json["bookmark_id"],
    duration: json["duration"],
    intakes: json["intakes"] != null ? json["intakes"] : "",
    courseName: json["course_name"],
    university: json["university"],
    studyLevel: json["study_level"],
    campus: json["campus"] != null ? json["campus"] : "",
    universityName: json["university_name"],
    country: json["country"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "bookmark_id": bookmarkId,
    "duration": duration,
    "intakes": intakes,
    "course_name": courseName,
    "university": university,
    "study_level": studyLevel,
    "campus": campus,
    "university_name": universityName,
    "country": country,
    "created_at": createdAt?.toIso8601String(),
  };
}
