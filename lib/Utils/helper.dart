import 'dart:ui';

import 'package:flutter/material.dart';

class Helper{

  //colors
  static Color bgColor = const Color(0xFFFFFFFF);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color blackColor = const Color(0xFF000000);
  static Color lightBlackColor = const Color(0xFF3F3E3E);
  static Color extraLightBlackColor = const Color(0xFF969696);
  static Color greyColor = const Color(0xFFB2B2B2);
  static Color lightGreyColor = const Color(0xA0F1F0F0);
  static Color transparentColor = const Color(0xFFFFFF);
  static Color darkBlueColor = const Color(0xFF031F42);
  static Color lightBlueColor = const Color(0xFF1A73E8);
  static Color extraLightBlueColor = const Color(0xFF04397A);
  static Color yellowColor = const Color(0xFFFFD41F);


  //images
  static String iconImg = "assets/images/app_icon.png";
  static String menuIconImg = "assets/images/menu_icon.png";
  static String userIcon = "assets/images/user_icon.jpg";
  static String ktHomePageTile = "assets/images/kt.png";
  static String plHomePageTile = "assets/images/pl.png";
  static String adHomePageTile = "assets/images/ad.png";
  static String elHomePageTile = "assets/images/el.png";
  static String elMoneyIcon = "assets/images/el_money.png";
  static String elDiscountIcon = "assets/images/el_discount.png";
  static String elTimerIcon = "assets/images/el_timer.png";
  static String ukImage = "assets/images/uk.jpg";
  static String ukFlag = "assets/images/uk_flag.png";
  static String ktOverviewImg = "assets/images/kt_overview_img.png";
  static String ktOverviewImgTwo = "assets/images/kt_overview_img_two.png";
  static String ktOverviewImgThree = "assets/images/kt_overview_img_three.png";
  static String ppMainImg = "assets/images/pp_main.png";
  static String ppFlagImg = "assets/images/pp_flag.png";
  static String ktMainImg = "assets/images/kt_main.png";
  static String ktFlagImg = "assets/images/kt_flag.png";
  static String bottomHpImg = "assets/images/bottom_hp.png";
  static String bottomLpImg = "assets/images/bottom_lp.png";
  static String ktOverviewMainImg = "assets/images/kt_overview_main_img.png";
  static String countryIcon = "assets/images/country_icon.png";
  static String durationIcon = "assets/images/duration_icon.png";
  static String intakeIcon = "assets/images/intake_icon.png";
  static String feeIcon = "assets/images/fee_icon.png";
  static String universityIcon = "assets/images/university_icon.png";
  static String studyLevelIcon = "assets/images/study_level_icon.png";
  static String campusIcon = "assets/images/campus_icon.png";

  //font name
  static String thick = "thick";

  static var btnGradient = LinearGradient(
    colors: [darkBlueColor, lightBlueColor],
  );

  //api url
  static String headerApiKey = "****";
  static String baseUrl = "https://********/api/user";
  static String otpApi = baseUrl+"/login";
  static String newUserApi = baseUrl+"/newUser";
  static String uploadProfilePicApi = baseUrl+"/uploadProfilePic";
  static String updateProfileApi = baseUrl+"/updateprofile";
  static String getFilterDataApi = baseUrl+"/getFilterData";
  static String getUnivercityCourseApi = baseUrl+"/getUniversityCourses";
  //static String addBookMarkApi = baseUrl+"/addBookmark";
  static String addBookMarkApi = baseUrl+"/addCoursePreference";
  //static String removeBookMarkApi = baseUrl+"/removeBookmark";
  static String removeBookMarkApi = baseUrl+"/deleteCoursePreference";
  //static String bookMarkListApi = baseUrl+"/bookmarkList";
  static String bookMarkListApi = baseUrl+"/getCoursePreferences";
  static String disciplineAreaApi = baseUrl+"/fetchDisciplineArea";
  static String applicationTrackApi = baseUrl+"/applicationTrack";
  //static String getWebinarsApi = baseUrl+"/getWebinarsApi";
  static String getWebinarsApi = baseUrl+"/getUserActivity";
  static String sendMailApi = baseUrl+"/sendInquiryData";
}