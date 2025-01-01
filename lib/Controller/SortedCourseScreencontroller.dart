import 'dart:convert';

import 'package:get/get.dart';
import '../Models/CoursePreferenceModel.dart';
import '../Utils/sPHelper.dart';
import 'package:eductrl/Utils/global.dart';
import 'package:flutter/material.dart';
import '../Utils/helper.dart';
import 'package:http/http.dart' as http;


class SortedCourseScreenController extends GetxController{

  RxBool isLoading = false.obs;
  List<CoursePreferenceData> courses = [];

  @override
  void onInit() {
    getBookMarkList();
    super.onInit();
  }


  getBookMarkList() async{
    isLoading.value = true;
    int userId = await SPHelper.getUserId();

    Uri url = Uri.parse(Helper.bookMarkListApi+"?user_id=$userId");
    var headers = {
      'apikey': Helper.headerApiKey
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");
        CoursePreferenceModel sortListedCourseModel = CoursePreferenceModel.fromJson(json.decode(response.body));
        if(sortListedCourseModel.data != null && sortListedCourseModel.data!.isNotEmpty){
          courses.addAll(sortListedCourseModel.data!);
        }
      }else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }

  removeBookMark(int bookmarkId,int index) async{
    isLoading.value = true;
    int userId = await SPHelper.getUserId();
    Uri url = Uri.parse(Helper.removeBookMarkApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };
    var bodyData = {
      'user_id': userId.toString(),
      'course_preference_id': bookmarkId.toString(),
    };

    try {
      final response = await http.post(url,body: bodyData, headers: headers);
    debugPrint("response.body ==> ${response.body}");
    debugPrint("response.body ==> ${response.statusCode}");

      if (response.statusCode == 200) {
        courses.removeAt(index);
        Global.showToast("Course removed from bookmark.");
      }else {
        Global.showToast("Failed to fetch data.");
      }

     } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }


}