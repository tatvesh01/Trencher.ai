// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  String? message;
  Data? data;
  int? otp;

  OtpModel({
    this.message,
    this.data,
    this.otp,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "otp": otp,
  };
}

class Data {
  int? id;
  String? uuid;
  dynamic sid;
  dynamic title;
  String? firstName;
  String? middleName;
  String? lastName;
  int? isLead;
  int? isStaff;
  int? isAgent;
  dynamic leadStatus;
  dynamic studentType;
  dynamic countryInterested;
  int? coachingCourseInterested;
  dynamic overseasStudyLevel;
  dynamic overseasStudyLevelSelection;
  dynamic overseasCourseIntersted;
  String? overseasStatus;
  String? coachingStatus;
  String? email;
  dynamic dialcode;
  String? mobile;
  dynamic whatsappDialcode;
  dynamic whatsapp;
  dynamic alternateContact;
  String? gender;
  dynamic address1;
  dynamic address2;
  dynamic postCode;
  dynamic city;
  dynamic state;
  String? country;
  dynamic birthday;
  int? agentId;
  int? refBy;
  int? refStatus;
  dynamic refcode;
  dynamic leadSource;
  dynamic leadFormType;
  dynamic profileComplete;
  dynamic applicationSubmitDate;
  int? branch;
  String? avatarType;
  dynamic avatarLocation;
  dynamic passwordChangedAt;
  bool? active;
  dynamic confirmationCode;
  bool? confirmed;
  dynamic timezone;
  dynamic lastLoginAt;
  dynamic lastLoginIp;
  int? assignedTo;
  int? reportingTo;
  dynamic lastFollowup;
  dynamic nextFollowup;
  dynamic counsellingDate;
  dynamic leadConvertedDate;
  int? leadConvertedBy;
  dynamic studentCreatedAt;
  dynamic services;
  dynamic tags;
  DateTime? createdAt;
  int? createdBy;
  DateTime? updatedAt;
  int? archived;
  dynamic createdMode;
  dynamic deletedAt;
  int? removed;
  int? otp;
  dynamic otpVerify;
  String? profilePic;
  String? fullName;

  Data({
    this.id,
    this.uuid,
    this.sid,
    this.title,
    this.firstName,
    this.middleName,
    this.lastName,
    this.isLead,
    this.isStaff,
    this.isAgent,
    this.leadStatus,
    this.studentType,
    this.countryInterested,
    this.coachingCourseInterested,
    this.overseasStudyLevel,
    this.overseasStudyLevelSelection,
    this.overseasCourseIntersted,
    this.overseasStatus,
    this.coachingStatus,
    this.email,
    this.dialcode,
    this.mobile,
    this.whatsappDialcode,
    this.whatsapp,
    this.alternateContact,
    this.gender,
    this.address1,
    this.address2,
    this.postCode,
    this.city,
    this.state,
    this.country,
    this.birthday,
    this.agentId,
    this.refBy,
    this.refStatus,
    this.refcode,
    this.leadSource,
    this.leadFormType,
    this.profileComplete,
    this.applicationSubmitDate,
    this.branch,
    this.avatarType,
    this.avatarLocation,
    this.passwordChangedAt,
    this.active,
    this.confirmationCode,
    this.confirmed,
    this.timezone,
    this.lastLoginAt,
    this.lastLoginIp,
    this.assignedTo,
    this.reportingTo,
    this.lastFollowup,
    this.nextFollowup,
    this.counsellingDate,
    this.leadConvertedDate,
    this.leadConvertedBy,
    this.studentCreatedAt,
    this.services,
    this.tags,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.archived,
    this.createdMode,
    this.deletedAt,
    this.removed,
    this.otp,
    this.otpVerify,
    this.profilePic,
    this.fullName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    uuid: json["uuid"],
    sid: json["sid"],
    title: json["title"],
    firstName: json["first_name"],
    middleName: json["middle_name"],
    lastName: json["last_name"],
    isLead: json["is_lead"],
    isStaff: json["is_staff"],
    isAgent: json["is_agent"],
    leadStatus: json["lead_status"],
    studentType: json["student_type"],
    countryInterested: json["country_interested"],
    coachingCourseInterested: json["coaching_course_interested"],
    overseasStudyLevel: json["overseas_study_level"],
    overseasStudyLevelSelection: json["overseas_study_level_selection"],
    overseasCourseIntersted: json["overseas_course_intersted"],
    overseasStatus: json["overseas_status"],
    coachingStatus: json["coaching_status"],
    email: json["email"],
    dialcode: json["dialcode"],
    mobile: json["mobile"],
    whatsappDialcode: json["whatsapp_dialcode"],
    whatsapp: json["whatsapp"],
    alternateContact: json["alternate_contact"],
    gender: json["gender"],
    address1: json["address_1"],
    address2: json["address_2"],
    postCode: json["post_code"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    birthday: json["birthday"],
    agentId: json["agent_id"],
    refBy: json["ref_by"],
    refStatus: json["ref_status"],
    refcode: json["refcode"],
    leadSource: json["lead_source"],
    leadFormType: json["lead_form_type"],
    profileComplete: json["profile_complete"],
    applicationSubmitDate: json["application_submit_date"],
    branch: json["branch"],
    avatarType: json["avatar_type"],
    avatarLocation: json["avatar_location"],
    passwordChangedAt: json["password_changed_at"],
    active: json["active"],
    confirmationCode: json["confirmation_code"],
    confirmed: json["confirmed"],
    timezone: json["timezone"],
    lastLoginAt: json["last_login_at"],
    lastLoginIp: json["last_login_ip"],
    assignedTo: json["assigned_to"],
    reportingTo: json["reporting_to"],
    lastFollowup: json["last_followup"],
    nextFollowup: json["next_followup"],
    counsellingDate: json["counselling_date"],
    leadConvertedDate: json["lead_converted_date"],
    leadConvertedBy: json["lead_converted_by"],
    studentCreatedAt: json["student_created_at"],
    services: json["services"],
    tags: json["tags"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    createdBy: json["created_by"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    archived: json["archived"],
    createdMode: json["created_mode"],
    deletedAt: json["deleted_at"],
    removed: json["removed"],
    otp: json["otp"],
    otpVerify: json["otp_verify"],
    profilePic: json["profile_pic"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "sid": sid,
    "title": title,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "is_lead": isLead,
    "is_staff": isStaff,
    "is_agent": isAgent,
    "lead_status": leadStatus,
    "student_type": studentType,
    "country_interested": countryInterested,
    "coaching_course_interested": coachingCourseInterested,
    "overseas_study_level": overseasStudyLevel,
    "overseas_study_level_selection": overseasStudyLevelSelection,
    "overseas_course_intersted": overseasCourseIntersted,
    "overseas_status": overseasStatus,
    "coaching_status": coachingStatus,
    "email": email,
    "dialcode": dialcode,
    "mobile": mobile,
    "whatsapp_dialcode": whatsappDialcode,
    "whatsapp": whatsapp,
    "alternate_contact": alternateContact,
    "gender": gender,
    "address_1": address1,
    "address_2": address2,
    "post_code": postCode,
    "city": city,
    "state": state,
    "country": country,
    "birthday": birthday,
    "agent_id": agentId,
    "ref_by": refBy,
    "ref_status": refStatus,
    "refcode": refcode,
    "lead_source": leadSource,
    "lead_form_type": leadFormType,
    "profile_complete": profileComplete,
    "application_submit_date": applicationSubmitDate,
    "branch": branch,
    "avatar_type": avatarType,
    "avatar_location": avatarLocation,
    "password_changed_at": passwordChangedAt,
    "active": active,
    "confirmation_code": confirmationCode,
    "confirmed": confirmed,
    "timezone": timezone,
    "last_login_at": lastLoginAt,
    "last_login_ip": lastLoginIp,
    "assigned_to": assignedTo,
    "reporting_to": reportingTo,
    "last_followup": lastFollowup,
    "next_followup": nextFollowup,
    "counselling_date": counsellingDate,
    "lead_converted_date": leadConvertedDate,
    "lead_converted_by": leadConvertedBy,
    "student_created_at": studentCreatedAt,
    "services": services,
    "tags": tags,
    "created_at": createdAt?.toIso8601String(),
    "created_by": createdBy,
    "updated_at": updatedAt?.toIso8601String(),
    "archived": archived,
    "created_mode": createdMode,
    "deleted_at": deletedAt,
    "removed": removed,
    "otp": otp,
    "otp_verify": otpVerify,
    "profile_pic": profilePic,
    "full_name": fullName,
  };
}
