// To parse this JSON data, do
//
//     final userRegisterModel = userRegisterModelFromJson(jsonString);

import 'dart:convert';

UserRegisterModel userRegisterModelFromJson(String str) => UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) => json.encode(data.toJson());

class UserRegisterModel {
  String? message;
  Data? data;

  UserRegisterModel({
    this.message,
    this.data,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) => UserRegisterModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? firstName;
  String? lastName;
  String? email;
  String? dialcode;
  String? country;
  String? mobile;
  String? whatsappDialcode;
  String? whatsapp;
  int? isLead;
  String? createdMode;
  String? leadStatus;
  String? leadSource;
  String? confirmationCode;
  bool? active;
  String? overseasStatus;
  String? refcode;
  int? refBy;
  bool? confirmed;
  String? uuid;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? studentType;
  dynamic branch;
  String? fullName;
  List<Role>? roles;

  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.dialcode,
    this.country,
    this.mobile,
    this.whatsappDialcode,
    this.whatsapp,
    this.isLead,
    this.createdMode,
    this.leadStatus,
    this.leadSource,
    this.confirmationCode,
    this.active,
    this.overseasStatus,
    this.refcode,
    this.refBy,
    this.confirmed,
    this.uuid,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.studentType,
    this.branch,
    this.fullName,
    this.roles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    dialcode: json["dialcode"],
    country: json["country"],
    mobile: json["mobile"],
    whatsappDialcode: json["whatsapp_dialcode"],
    whatsapp: json["whatsapp"],
    isLead: json["is_lead"],
    createdMode: json["created_mode"],
    leadStatus: json["lead_status"],
    leadSource: json["lead_source"],
    confirmationCode: json["confirmation_code"],
    active: json["active"],
    overseasStatus: json["overseas_status"],
    refcode: json["refcode"],
    refBy: json["ref_by"],
    confirmed: json["confirmed"],
    uuid: json["uuid"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    studentType: json["student_type"],
    branch: json["branch"],
    fullName: json["full_name"],
    roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "dialcode": dialcode,
    "country": country,
    "mobile": mobile,
    "whatsapp_dialcode": whatsappDialcode,
    "whatsapp": whatsapp,
    "is_lead": isLead,
    "created_mode": createdMode,
    "lead_status": leadStatus,
    "lead_source": leadSource,
    "confirmation_code": confirmationCode,
    "active": active,
    "overseas_status": overseasStatus,
    "refcode": refcode,
    "ref_by": refBy,
    "confirmed": confirmed,
    "uuid": uuid,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "student_type": studentType,
    "branch": branch,
    "full_name": fullName,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
  };
}

class Role {
  int? id;
  String? name;
  int? managerial;
  String? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Role({
    this.id,
    this.name,
    this.managerial,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    managerial: json["managerial"],
    guardName: json["guard_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "managerial": managerial,
    "guard_name": guardName,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    modelId: json["model_id"],
    roleId: json["role_id"],
    modelType: json["model_type"],
  );

  Map<String, dynamic> toJson() => {
    "model_id": modelId,
    "role_id": roleId,
    "model_type": modelType,
  };
}
