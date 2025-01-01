// To parse this JSON data, do
//
//     final trackAppModel = trackAppModelFromJson(jsonString);

import 'dart:convert';

TrackAppModel trackAppModelFromJson(String str) => TrackAppModel.fromJson(json.decode(str));

String trackAppModelToJson(TrackAppModel data) => json.encode(data.toJson());

class TrackAppModel {
  String? message;
  List<TrackAppData>? data;

  TrackAppModel({
    this.message,
    this.data,
  });

  factory TrackAppModel.fromJson(Map<String, dynamic> json) => TrackAppModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<TrackAppData>.from(json["data"]!.map((x) => TrackAppData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TrackAppData {
  int? id;
  String? country;
  String? details;
  dynamic openDate;
  dynamic closeDate;
  String? status;
  int? applId;

  TrackAppData({
    this.id,
    this.country,
    this.details,
    this.openDate,
    this.closeDate,
    this.status,
    this.applId,
  });

  factory TrackAppData.fromJson(Map<String, dynamic> json) => TrackAppData(
    id: json["id"],
    country: json["country"],
    details: json["details"],
    openDate: json["open_date"],
    closeDate: json["close_date"],
    status: json["status"],
    applId: json["appl_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "details": details,
    "open_date": openDate,
    "close_date": closeDate,
    "status": status,
    "appl_id": applId,
  };
}
