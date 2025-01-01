// To parse this JSON data, do
//
//     final displineAreaModel = displineAreaModelFromJson(jsonString);

import 'dart:convert';

DisplineAreaModel displineAreaModelFromJson(String str) => DisplineAreaModel.fromJson(json.decode(str));

String displineAreaModelToJson(DisplineAreaModel data) => json.encode(data.toJson());

class DisplineAreaModel {
  String? message;
  List<DisplinOptions>? data;

  DisplineAreaModel({
    this.message,
    this.data,
  });

  factory DisplineAreaModel.fromJson(Map<String, dynamic> json) => DisplineAreaModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<DisplinOptions>.from(json["data"]!.map((x) => DisplinOptions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DisplinOptions {
  String? title;
  int? id;

  DisplinOptions({
    this.title,
    this.id,
  });

  factory DisplinOptions.fromJson(Map<String, dynamic> json) => DisplinOptions(
    title: json["title"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
  };
}
