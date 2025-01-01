// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  String? message;
  List<Datum>? data;

  CourseModel({
    this.message,
    this.data,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? country;
  String? countryName;
  //UniversityName? universityName;
  String? universityName;
  int? id;
  String? courseName;
  String? courseDetails;
  String? courseContent;
  int? category;
  int? university;
  String? studyLevel;
  //Campus? campus;
  String? duration;
  String? intakes;
  dynamic year;
  //OccupationOutcome? occupationOutcome;
  String? practicalWork;
  String? qualifyExtendedVisa;
  String? regionalLocation;
  String? countryStudentsNotAccepted;
  String? websiteUrl;
  String? entryRequirements;
  String? ieltsScore;
  dynamic ieltsNoBandLessThan;
  String? toeflScore;
  dynamic toeflNoBandLessThan;
  String? pteScore;
  dynamic pteNoBandLessThan;
  String? greScore;
  String? gmatScore;
  //ApplicationDeadline? applicationDeadline;
  String? applicationFee;
  dynamic tuitionFeeOnshore;
  dynamic tuitionFeeOffshore;
  dynamic nonTuitionFee;
  String? currency;
  String? yearlyTuitionFee;
  String? totalTuitionFee;
  dynamic scholarshipAvailable;
  dynamic scholarshipDetail;
  dynamic backlogRange;
  dynamic remarks;
  dynamic eslElpDetail;
  String? applicationmode;
  String? detscore;
  int? status;
  dynamic concentration;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.country,
    this.countryName,
    this.universityName,
    this.id,
    this.courseName,
    this.courseDetails,
    this.courseContent,
    this.category,
    this.university,
    this.studyLevel,
    //this.campus,
    this.duration,
    this.intakes,
    this.year,
    //this.occupationOutcome,
    this.practicalWork,
    this.qualifyExtendedVisa,
    this.regionalLocation,
    this.countryStudentsNotAccepted,
    this.websiteUrl,
    this.entryRequirements,
    this.ieltsScore,
    this.ieltsNoBandLessThan,
    this.toeflScore,
    this.toeflNoBandLessThan,
    this.pteScore,
    this.pteNoBandLessThan,
    this.greScore,
    this.gmatScore,
    //this.applicationDeadline,
    this.applicationFee,
    this.tuitionFeeOnshore,
    this.tuitionFeeOffshore,
    this.nonTuitionFee,
    this.currency,
    this.yearlyTuitionFee,
    this.totalTuitionFee,
    this.scholarshipAvailable,
    this.scholarshipDetail,
    this.backlogRange,
    this.remarks,
    this.eslElpDetail,
    this.applicationmode,
    this.detscore,
    this.status,
    this.concentration,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    country: json["country"],
    countryName: json["country_name"],
    //universityName: universityNameValues.map[json["university_name"]]!,
    universityName: json["university_name"] ?? "",
    id: json["id"],
    courseName: json["course_name"],
    courseDetails: json["course_details"],
    courseContent: json["course_content"],
    category: json["category"],
    university: json["university"],
    studyLevel: json["study_level"] ?? "",
    //campus: json["campus"] == null ? campusValues.map[0] : campusValues.map[json["campus"]]!,
    duration: json["duration"],
    //intakes: intakesValues.map[json["intakes"]]!,
    intakes: json["intakes"] ?? "",
    year: json["year"],
    //occupationOutcome: occupationOutcomeValues.map[json["occupation_outcome"]]!,
    practicalWork: json["practical_work"],
    qualifyExtendedVisa: json["qualify_extended_visa"],
    regionalLocation: json["regional_location"],
    countryStudentsNotAccepted: json["country_students_not_accepted"],
    websiteUrl: json["website_url"],
    entryRequirements: json["entry_requirements"],
    ieltsScore: json["ielts_score"],
    ieltsNoBandLessThan: json["ielts_no_band_less_than"],
    toeflScore: json["toefl_score"],
    toeflNoBandLessThan: json["toefl_no_band_less_than"],
    pteScore: json["pte_score"],
    pteNoBandLessThan: json["pte_no_band_less_than"],
    greScore: json["gre_score"],
    gmatScore: json["gmat_score"],
    //applicationDeadline: applicationDeadlineValues.map[json["application_deadline"]]!,
    applicationFee: json["application_fee"],
    tuitionFeeOnshore: json["tuition_fee_onshore"],
    tuitionFeeOffshore: json["tuition_fee_offshore"],
    nonTuitionFee: json["non_tuition_fee"],
    currency: json["currency"] ?? "",
    yearlyTuitionFee: json["yearly_tuition_fee"],
    totalTuitionFee: json["total_tuition_fee"],
    scholarshipAvailable: json["scholarship_available"],
    scholarshipDetail: json["scholarship_detail"],
    backlogRange: json["backlog_range"],
    remarks: json["remarks"],
    eslElpDetail: json["esl_elp_detail"],
    applicationmode: json["applicationmode"],
    detscore: json["detscore"],
    status: json["status"],
    concentration: json["concentration"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "country_name": countryName,
    //"university_name": universityNameValues.reverse[universityName],
    "university_name":universityName,
    "id": id,
    "course_name": courseName,
    "course_details": courseDetails,
    "course_content": courseContent,
    "category": category,
    "university": university,
    //"study_level": occupationOutcomeValues.reverse[studyLevel],
    "study_level": studyLevel,
    //"campus": campusValues.reverse[campus],
    "duration": duration,
    //"intakes": intakesValues.reverse[intakes],
    "intakes": intakes,
    "year": year,
    //"occupation_outcome": occupationOutcomeValues.reverse[occupationOutcome],
    "practical_work": practicalWork,
    "qualify_extended_visa": qualifyExtendedVisa,
    "regional_location": regionalLocation,
    "country_students_not_accepted": countryStudentsNotAccepted,
    "website_url": websiteUrl,
    "entry_requirements": entryRequirements,
    "ielts_score": ieltsScore,
    "ielts_no_band_less_than": ieltsNoBandLessThan,
    "toefl_score": toeflScore,
    "toefl_no_band_less_than": toeflNoBandLessThan,
    "pte_score": pteScore,
    "pte_no_band_less_than": pteNoBandLessThan,
    "gre_score": greScore,
    "gmat_score": gmatScore,
    //"application_deadline": applicationDeadlineValues.reverse[applicationDeadline],
    "application_fee": applicationFee,
    "tuition_fee_onshore": tuitionFeeOnshore,
    "tuition_fee_offshore": tuitionFeeOffshore,
    "non_tuition_fee": nonTuitionFee,
    "currency": currency,
    "yearly_tuition_fee": yearlyTuitionFee,
    "total_tuition_fee": totalTuitionFee,
    "scholarship_available": scholarshipAvailable,
    "scholarship_detail": scholarshipDetail,
    "backlog_range": backlogRange,
    "remarks": remarks,
    "esl_elp_detail": eslElpDetail,
    "applicationmode": applicationmode,
    "detscore": detscore,
    "status": status,
    "concentration": concentration,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum ApplicationDeadline {
  SCHOLAR_S_ROUND_15_TH_DEC_2024
}

final applicationDeadlineValues = EnumValues({
  "Scholar's Round: 15th Dec 2024": ApplicationDeadline.SCHOLAR_S_ROUND_15_TH_DEC_2024
});

enum Campus {
  AUBURN_ALABAMA,
  BALTIMORE_MARYLAND,
  BETHLEHEM_PENNSYLVANIA,
  BIRMINGHAM_ENGLAND,
  BOCA_RATON_FLORIDA,
  BOSTON_MASSACHUSETTS,
  BOZEMAN_MONTANA,
  CAMBRIDGE_ENGLAND,
  CHARLESTON_WEST_VIRGINIA,
  CHESTER_PENNSYLVANIA,
  CHICAGO_ILLINOIS,
  CLEVELAND_OHIO,
  COLUMBIA_SOUTH_CAROLINA,
  COVENTRY_ENGLAND,
  DAYTON_OHIO,
  DUBUQUE_IOWA,
  EDINBURGH_SCOTLAND,
  EGHAM_ENGLAND,
  EXETER_ENGLAND,
  FAIRBANKS_ALASKA,
  FAIRFIELD_CONNECTICUT,
  FARNHAM_ENGLAND,
  GARDEN_CITY_NEW_YORK,
  GLASGOW_SCOTLAND,
  GUILDFORD_ENGLAND,
  HIGH_WYCOMBE_ENGLAND,
  HULL_ENGLAND,
  HYDERABAD,
  JOHANNESBURG,
  KANSAS_CITY_MISSOURI,
  LARAMIE_WYOMING,
  LEICESTER_ENGLAND,
  LIVERPOOL_ENGLAND,
  LONDON_ENGLAND,
  LOUISVILLE_KENTUCKY,
  MALIBU_CALIFORNIA,
  NASHVILLE_TENNESSEE,
  NEW_BRUNSWICK_NEW_JERSEY,
  NEW_ORLEANS_LOUISIANA,
  NORWICH_ENGLAND,
  OKLAHOMA_CITY_OKLAHOMA,
  OXFORD_ENGLAND,
  REDLANDS_CALIFORNIA,
  RIVER_FOREST_ILLINOIS,
  ROLLA_MISSOURI,
  ROMEOVILLE_ILLINOIS,
  SAN_ANTONIO_TEXAS,
  SHEFFIELD_ENGLAND,
  SPARTANBURG_SOUTH_CAROLINA,
  SPOKANE_WASHINGTON,
  SPRINGFIELD_MASSACHUSETTS,
  STEVENS_POINT_WISCONSIN,
  STIRLING_SCOTLAND,
  ST_LOUIS_MISSOURI,
  SUNDERLAND_ENGLAND,
  WASHINGTON_DISTRICT_OF_COLUMBIA,
  WAUKESHA_WISCONSIN,
  WEBSTER_GROVES_MISSOURI,
  WEST_PALM_BEACH_FLORIDA,
  WINONA_MINNESOTA,
  YORK_ENGLAND
}

final campusValues = EnumValues({
  "Auburn, Alabama": Campus.AUBURN_ALABAMA,
  "Baltimore, Maryland": Campus.BALTIMORE_MARYLAND,
  "Bethlehem, Pennsylvania": Campus.BETHLEHEM_PENNSYLVANIA,
  "Birmingham, England": Campus.BIRMINGHAM_ENGLAND,
  "Boca Raton, Florida": Campus.BOCA_RATON_FLORIDA,
  "Boston, Massachusetts": Campus.BOSTON_MASSACHUSETTS,
  "Bozeman, Montana": Campus.BOZEMAN_MONTANA,
  "Cambridge, England": Campus.CAMBRIDGE_ENGLAND,
  "Charleston, West Virginia": Campus.CHARLESTON_WEST_VIRGINIA,
  "Chester, Pennsylvania": Campus.CHESTER_PENNSYLVANIA,
  "Chicago, Illinois": Campus.CHICAGO_ILLINOIS,
  "Cleveland, Ohio": Campus.CLEVELAND_OHIO,
  "Columbia, South Carolina": Campus.COLUMBIA_SOUTH_CAROLINA,
  "Coventry, England": Campus.COVENTRY_ENGLAND,
  "Dayton, Ohio": Campus.DAYTON_OHIO,
  "Dubuque, Iowa": Campus.DUBUQUE_IOWA,
  "Edinburgh, Scotland": Campus.EDINBURGH_SCOTLAND,
  "Egham, England": Campus.EGHAM_ENGLAND,
  "Exeter, England": Campus.EXETER_ENGLAND,
  "Fairbanks, Alaska": Campus.FAIRBANKS_ALASKA,
  "Fairfield, Connecticut": Campus.FAIRFIELD_CONNECTICUT,
  "Farnham, England": Campus.FARNHAM_ENGLAND,
  "Garden City, New York": Campus.GARDEN_CITY_NEW_YORK,
  "Glasgow, Scotland": Campus.GLASGOW_SCOTLAND,
  "Guildford, England": Campus.GUILDFORD_ENGLAND,
  "High Wycombe, England": Campus.HIGH_WYCOMBE_ENGLAND,
  "Hull, England": Campus.HULL_ENGLAND,
  "Hyderabad": Campus.HYDERABAD,
  "Johannesburg": Campus.JOHANNESBURG,
  "Kansas City, Missouri": Campus.KANSAS_CITY_MISSOURI,
  "Laramie, Wyoming": Campus.LARAMIE_WYOMING,
  "Leicester, England": Campus.LEICESTER_ENGLAND,
  "Liverpool, England": Campus.LIVERPOOL_ENGLAND,
  "London, England": Campus.LONDON_ENGLAND,
  "Louisville, Kentucky": Campus.LOUISVILLE_KENTUCKY,
  "Malibu, California": Campus.MALIBU_CALIFORNIA,
  "Nashville, Tennessee": Campus.NASHVILLE_TENNESSEE,
  "New Brunswick, New Jersey": Campus.NEW_BRUNSWICK_NEW_JERSEY,
  "New Orleans, Louisiana": Campus.NEW_ORLEANS_LOUISIANA,
  "Norwich, England": Campus.NORWICH_ENGLAND,
  "Oklahoma City, Oklahoma": Campus.OKLAHOMA_CITY_OKLAHOMA,
  "Oxford, England": Campus.OXFORD_ENGLAND,
  "Redlands, California": Campus.REDLANDS_CALIFORNIA,
  "River Forest, Illinois": Campus.RIVER_FOREST_ILLINOIS,
  "Rolla, Missouri": Campus.ROLLA_MISSOURI,
  "Romeoville, Illinois": Campus.ROMEOVILLE_ILLINOIS,
  "San Antonio, Texas": Campus.SAN_ANTONIO_TEXAS,
  "Sheffield, England": Campus.SHEFFIELD_ENGLAND,
  "Spartanburg, South Carolina": Campus.SPARTANBURG_SOUTH_CAROLINA,
  "Spokane, Washington": Campus.SPOKANE_WASHINGTON,
  "Springfield, Massachusetts": Campus.SPRINGFIELD_MASSACHUSETTS,
  "Stevens Point, Wisconsin": Campus.STEVENS_POINT_WISCONSIN,
  "Stirling, Scotland": Campus.STIRLING_SCOTLAND,
  "St. Louis, Missouri": Campus.ST_LOUIS_MISSOURI,
  "Sunderland, England": Campus.SUNDERLAND_ENGLAND,
  "Washington, District Of Columbia": Campus.WASHINGTON_DISTRICT_OF_COLUMBIA,
  "Waukesha, Wisconsin": Campus.WAUKESHA_WISCONSIN,
  "Webster Groves, Missouri": Campus.WEBSTER_GROVES_MISSOURI,
  "West Palm Beach, Florida": Campus.WEST_PALM_BEACH_FLORIDA,
  "Winona, Minnesota": Campus.WINONA_MINNESOTA,
  "York, England": Campus.YORK_ENGLAND
});

enum Intakes {
  AUGUST,
  JAN,
  JAN_FEB_MAR_APR_MAY_JUN_JUL_AUG_SEP_OCT_NOV_DEC,
  JUL
}

final intakesValues = EnumValues({
  "August": Intakes.AUGUST,
  "Jan": Intakes.JAN,
  "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec": Intakes.JAN_FEB_MAR_APR_MAY_JUN_JUL_AUG_SEP_OCT_NOV_DEC,
  "Jul": Intakes.JUL
});

enum OccupationOutcome {
  CPL,
  PH_D,
  POSTGRADUATE,
  UNDERGRADUATE,
  UNDER_GRADUATE
}

final occupationOutcomeValues = EnumValues({
  "CPL": OccupationOutcome.CPL,
  "PhD": OccupationOutcome.PH_D,
  "Postgraduate": OccupationOutcome.POSTGRADUATE,
  "Undergraduate": OccupationOutcome.UNDERGRADUATE,
  "Under Graduate": OccupationOutcome.UNDER_GRADUATE
});

enum UniversityName {
  ADELPHI_UNIVERSITY,
  AMERICAN_UNIVERSITY,
  ANGLIA_RUSKIN_UNIVERSITY_ARU,
  ASTON_UNIVERSITY,
  AUBURN_UNIVERSITY,
  AVIATION_JUNCTION_FLYING_SCHOOL,
  AVILA_UNIVERSITY,
  BELLARMINE_UNIVERSITY,
  BELMONT_UNIVERSITY,
  BUCKINGHAMSHIRE_NEW_UNIVERSITY_PROGRAMS,
  CARROLL_UNIVERSITY,
  CLEVELAND_STATE_UNIVERSITY,
  CONCORDIA_UNIVERSITY_CHICAGO,
  COVENTRY_UNIVERSITY,
  DE_MONTFORT_UNIVERSITY,
  EDINBURGH_NAPIER_UNIVERSITY,
  FAIRFIELD_UNIVERSITY,
  GONZAGA_UNIVERSITY_GU,
  JOHNS_HOPKINS_UNIVERSITY,
  LEWIS_UNIVERSITY,
  LIVERPOOL_JOHN_MOORES_UNIVERSITY_LJMU,
  LYNN_UNIVERSITY,
  MISSOURI_UNIVERSITY_OF_SCIENCE_AND_TECHNOLOGY,
  MONTANA_STATE_UNIVERSITY_MSU_BILLINGS,
  MORAVIAN_COLLEGE,
  OKLAHOMA_CITY_UNIVERSITY_OCU,
  OXFORD_BROOKES_UNIVERSITY,
  PALM_BEACH_ATLANTIC_UNIVERSITY_PBA,
  PEPPERDINE_UNIVERSITY,
  ROBERT_MORRIS_UNIVERSITY_RMU,
  ROYAL_HOLLOWAY,
  RUTGERS_UNIVERSITY,
  SAINT_MARY_S_UNIVERSITY_OF_MINNESOTA_SMUMN,
  THE_UNIVERSITY_OF_LAW,
  TULANE_UNIVERSITY,
  UNIVERSITY_FOR_THE_CREATIVE_ARTS_UCA,
  UNIVERSITY_OF_ALASKA_UAF,
  UNIVERSITY_OF_CHARLESTON_UC,
  UNIVERSITY_OF_DAYTON,
  UNIVERSITY_OF_DUBUQUE,
  UNIVERSITY_OF_EAST_ANGLIA_UEA,
  UNIVERSITY_OF_EAST_LONDON,
  UNIVERSITY_OF_EXETER,
  UNIVERSITY_OF_GREENWICH,
  UNIVERSITY_OF_HULL,
  UNIVERSITY_OF_LEICESTER_LE,
  UNIVERSITY_OF_LIVERPOOL,
  UNIVERSITY_OF_MASSACHUSETTS_BOSTON_CAMPUS,
  UNIVERSITY_OF_MISSOURI_ST_LOUIS_UMSL_RANKING,
  UNIVERSITY_OF_REDLANDS,
  UNIVERSITY_OF_SHEFFIELD,
  UNIVERSITY_OF_SOUTH_CAROLINA,
  UNIVERSITY_OF_STIRLING,
  UNIVERSITY_OF_STRATHCLYDE,
  UNIVERSITY_OF_SUNDERLAND,
  UNIVERSITY_OF_SURREY,
  UNIVERSITY_OF_TEXAS_AT_SAN_ANTONIO,
  UNIVERSITY_OF_WISCONSIN_UWSP,
  UNIVERSITY_OF_WYOMING,
  UNIVERSITY_OF_YORK,
  WEBSTER_UNIVERSITY_RANKINGS,
  WENTWORTH_INSTITUTE_OF_TECHNOLOGY_WIT,
  WESTERN_NEW_ENGLAND_UNIVERSITY_WNE_SPRINGFIELD_COURSES,
  WIDENER_UNIVERSITY,
  WOXSEN_UNIVERSITY
}

/*final universityNameValues = EnumValues({
  "Adelphi University": UniversityName.ADELPHI_UNIVERSITY,
  "American University": UniversityName.AMERICAN_UNIVERSITY,
  "Anglia Ruskin University [ARU]": UniversityName.ANGLIA_RUSKIN_UNIVERSITY_ARU,
  "Aston University": UniversityName.ASTON_UNIVERSITY,
  "Auburn University": UniversityName.AUBURN_UNIVERSITY,
  "Aviation Junction Flying School": UniversityName.AVIATION_JUNCTION_FLYING_SCHOOL,
  "Avila University": UniversityName.AVILA_UNIVERSITY,
  "Bellarmine University": UniversityName.BELLARMINE_UNIVERSITY,
  "Belmont University": UniversityName.BELMONT_UNIVERSITY,
  "Buckinghamshire New University Programs": UniversityName.BUCKINGHAMSHIRE_NEW_UNIVERSITY_PROGRAMS,
  "Carroll University": UniversityName.CARROLL_UNIVERSITY,
  "Cleveland State University": UniversityName.CLEVELAND_STATE_UNIVERSITY,
  "Concordia University Chicago": UniversityName.CONCORDIA_UNIVERSITY_CHICAGO,
  "Coventry University": UniversityName.COVENTRY_UNIVERSITY,
  "De Montfort University": UniversityName.DE_MONTFORT_UNIVERSITY,
  "Edinburgh Napier University": UniversityName.EDINBURGH_NAPIER_UNIVERSITY,
  "Fairfield University": UniversityName.FAIRFIELD_UNIVERSITY,
  "Gonzaga University [GU]": UniversityName.GONZAGA_UNIVERSITY_GU,
  "Johns Hopkins University": UniversityName.JOHNS_HOPKINS_UNIVERSITY,
  "Lewis University": UniversityName.LEWIS_UNIVERSITY,
  "Liverpool John Moores University [LJMU]": UniversityName.LIVERPOOL_JOHN_MOORES_UNIVERSITY_LJMU,
  "Lynn University": UniversityName.LYNN_UNIVERSITY,
  "Missouri University of Science and Technology": UniversityName.MISSOURI_UNIVERSITY_OF_SCIENCE_AND_TECHNOLOGY,
  "Montana State University (MSU) Billings": UniversityName.MONTANA_STATE_UNIVERSITY_MSU_BILLINGS,
  "Moravian College": UniversityName.MORAVIAN_COLLEGE,
  "Oklahoma City University [OCU]": UniversityName.OKLAHOMA_CITY_UNIVERSITY_OCU,
  "Oxford Brookes University": UniversityName.OXFORD_BROOKES_UNIVERSITY,
  "Palm Beach Atlantic University [PBA]": UniversityName.PALM_BEACH_ATLANTIC_UNIVERSITY_PBA,
  "Pepperdine University": UniversityName.PEPPERDINE_UNIVERSITY,
  "Robert Morris University [RMU]": UniversityName.ROBERT_MORRIS_UNIVERSITY_RMU,
  "Royal Holloway": UniversityName.ROYAL_HOLLOWAY,
  "Rutgers University": UniversityName.RUTGERS_UNIVERSITY,
  "Saint Mary's University of Minnesota [SMUMN]": UniversityName.SAINT_MARY_S_UNIVERSITY_OF_MINNESOTA_SMUMN,
  "The University of Law": UniversityName.THE_UNIVERSITY_OF_LAW,
  "Tulane University": UniversityName.TULANE_UNIVERSITY,
  "University for the Creative Arts [UCA]": UniversityName.UNIVERSITY_FOR_THE_CREATIVE_ARTS_UCA,
  "University of Alaska [UAF": UniversityName.UNIVERSITY_OF_ALASKA_UAF,
  "University of Charleston [UC]": UniversityName.UNIVERSITY_OF_CHARLESTON_UC,
  "University of Dayton": UniversityName.UNIVERSITY_OF_DAYTON,
  "University of Dubuque": UniversityName.UNIVERSITY_OF_DUBUQUE,
  "University of East Anglia [UEA]": UniversityName.UNIVERSITY_OF_EAST_ANGLIA_UEA,
  "University of East London": UniversityName.UNIVERSITY_OF_EAST_LONDON,
  "University of Exeter": UniversityName.UNIVERSITY_OF_EXETER,
  "University of Greenwich": UniversityName.UNIVERSITY_OF_GREENWICH,
  "University of Hull": UniversityName.UNIVERSITY_OF_HULL,
  "University of Leicester [LE]": UniversityName.UNIVERSITY_OF_LEICESTER_LE,
  "University of Liverpool": UniversityName.UNIVERSITY_OF_LIVERPOOL,
  "University of Massachusetts Boston Campus": UniversityName.UNIVERSITY_OF_MASSACHUSETTS_BOSTON_CAMPUS,
  "University of Missouri St. Louis [UMSL] Ranking": UniversityName.UNIVERSITY_OF_MISSOURI_ST_LOUIS_UMSL_RANKING,
  "University of Redlands": UniversityName.UNIVERSITY_OF_REDLANDS,
  "University of Sheffield": UniversityName.UNIVERSITY_OF_SHEFFIELD,
  "University of South Carolina": UniversityName.UNIVERSITY_OF_SOUTH_CAROLINA,
  "University of Stirling": UniversityName.UNIVERSITY_OF_STIRLING,
  "University of Strathclyde": UniversityName.UNIVERSITY_OF_STRATHCLYDE,
  "University of Sunderland": UniversityName.UNIVERSITY_OF_SUNDERLAND,
  "University of Surrey": UniversityName.UNIVERSITY_OF_SURREY,
  "University of Texas at San Antonio": UniversityName.UNIVERSITY_OF_TEXAS_AT_SAN_ANTONIO,
  "University of Wisconsin [UWSP]": UniversityName.UNIVERSITY_OF_WISCONSIN_UWSP,
  "University of Wyoming": UniversityName.UNIVERSITY_OF_WYOMING,
  "University of York": UniversityName.UNIVERSITY_OF_YORK,
  "Webster University Rankings": UniversityName.WEBSTER_UNIVERSITY_RANKINGS,
  "Wentworth Institute of Technology [WIT]": UniversityName.WENTWORTH_INSTITUTE_OF_TECHNOLOGY_WIT,
  "Western New England University [WNE] Springfield Courses": UniversityName.WESTERN_NEW_ENGLAND_UNIVERSITY_WNE_SPRINGFIELD_COURSES,
  "Widener University": UniversityName.WIDENER_UNIVERSITY,
  "Woxsen University": UniversityName.WOXSEN_UNIVERSITY
});*/

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
