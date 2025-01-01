// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  String? message;
  List<Datum>? data;

  NotificationModel({
    this.message,
    this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? userId;
  String? type;
  String? title;
  String? detail;
  int? leadFollowup;
  dynamic leadStatusChangedTo;
  int? leadAssignedTo;
  dynamic studentStatusChangedTo;
  int? studentAssignedTo;
  int? staff;
  dynamic communicationMode;
  dynamic applicationStatus;
  int? workflowCampaignId;
  dynamic attachment;
  dynamic callyzerCallId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.detail,
    this.leadFollowup,
    this.leadStatusChangedTo,
    this.leadAssignedTo,
    this.studentStatusChangedTo,
    this.studentAssignedTo,
    this.staff,
    this.communicationMode,
    this.applicationStatus,
    this.workflowCampaignId,
    this.attachment,
    this.callyzerCallId,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    type: json["type"],
    title: json["title"],
    detail: json["detail"],
    leadFollowup: json["lead_followup"],
    leadStatusChangedTo: json["lead_status_changed_to"],
    leadAssignedTo: json["lead_assigned_to"],
    studentStatusChangedTo: json["student_status_changed_to"],
    studentAssignedTo: json["student_assigned_to"],
    staff: json["staff"],
    communicationMode: json["communication_mode"],
    applicationStatus: json["application_status"],
    workflowCampaignId: json["workflow_campaign_id"],
    attachment: json["attachment"],
    callyzerCallId: json["callyzer_call_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "type": type,
    "title": title,
    "detail": detail,
    "lead_followup": leadFollowup,
    "lead_status_changed_to": leadStatusChangedTo,
    "lead_assigned_to": leadAssignedTo,
    "student_status_changed_to": studentStatusChangedTo,
    "student_assigned_to": studentAssignedTo,
    "staff": staff,
    "communication_mode": communicationMode,
    "application_status": applicationStatus,
    "workflow_campaign_id": workflowCampaignId,
    "attachment": attachment,
    "callyzer_call_id": callyzerCallId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
