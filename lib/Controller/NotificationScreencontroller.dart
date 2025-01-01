import 'package:get/get.dart';
import '../Models/NotificationModel.dart';
import '../Utils/sPHelper.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../Models/TrackAppModel.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';
import 'package:http/http.dart' as http;

class NotificationScreenController extends GetxController{
  RxBool isLoading = false.obs;


  List<Datum> notifications = [];

  @override
  void onInit() {
    getNotiList();
    super.onInit();
  }

  getNotiList() async{
    isLoading.value = true;
    int userId = await SPHelper.getUserId();
    Uri url = Uri.parse(Helper.getWebinarsApi+"?user_id=$userId");
    var headers = {
      'apikey': Helper.headerApiKey
    };
    /*var bodyData = {
      'student_id': userId.toString(),
    };*/

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");
        NotificationModel notificationModel = NotificationModel.fromJson(json.decode(response.body));

        if(notificationModel.data != null && notificationModel.data!.isNotEmpty){
          notifications.addAll(notificationModel.data!);
        }
        notifications = notifications.reversed.toList();
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