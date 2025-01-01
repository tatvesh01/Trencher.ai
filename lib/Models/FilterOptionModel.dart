// To parse this JSON data, do
//
//     final filterOptionModel = filterOptionModelFromJson(jsonString);

import 'dart:convert';

FilterOptionModel filterOptionModelFromJson(String str) => FilterOptionModel.fromJson(json.decode(str));

String filterOptionModelToJson(FilterOptionModel data) => json.encode(data.toJson());

class FilterOptionModel {
  String? message;
  Data? data;

  FilterOptionModel({
    this.message,
    this.data,
  });

  factory FilterOptionModel.fromJson(Map<String, dynamic> json) => FilterOptionModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Country>? studyCountries;
  List<Country>? nationality;
  List<UniversityCourseCategory>? universityCourseCategories;

  Data({
    this.studyCountries,
    this.nationality,
    this.universityCourseCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    studyCountries: json["study_countries"] == null ? [] : List<Country>.from(json["study_countries"]!.map((x) => Country.fromJson(x))),
    nationality: json["countries"] == null ? [] : List<Country>.from(json["countries"]!.map((x) => Country.fromJson(x))),
    universityCourseCategories: json["university_course_categories"] == null ? [] : List<UniversityCourseCategory>.from(json["university_course_categories"]!.map((x) => UniversityCourseCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "study_countries": studyCountries == null ? [] : List<dynamic>.from(studyCountries!.map((x) => x.toJson())),
    "countries": nationality == null ? [] : List<dynamic>.from(nationality!.map((x) => x.toJson())),
    "university_course_categories": universityCourseCategories == null ? [] : List<dynamic>.from(universityCourseCategories!.map((x) => x.toJson())),
  };
}

class Country {
  int? id;
  String? name;

  Country({
    this.id,
    this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class UniversityCourseCategory {
  int? id;
  String? title;
  dynamic description;
  int? parentId;
  int? displayOrder;
  String? seoUrlSlug;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  UniversityCourseCategory({
    this.id,
    this.title,
    this.description,
    this.parentId,
    this.displayOrder,
    this.seoUrlSlug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory UniversityCourseCategory.fromJson(Map<String, dynamic> json) => UniversityCourseCategory(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    parentId: json["parent_id"],
    displayOrder: json["display_order"],
    seoUrlSlug: json["seo_url_slug"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "parent_id": parentId,
    "display_order": displayOrder,
    "seo_url_slug": seoUrlSlug,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
