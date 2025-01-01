import 'dart:convert';

import 'package:eductrl/Ui/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/TrackAppModel.dart';
import '../Ui/fill_details_screen.dart';
import '../Ui/login_screen.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';
import '../Utils/sPHelper.dart';
import 'package:http/http.dart' as http;


class TrackApplicationScreenController extends GetxController{

  final List<TrackAppData> applications = [];
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    getAppList();
    super.onInit();
  }


  getAppList() async{
    isLoading.value = true;
    int userId = await SPHelper.getUserId();

    Uri url = Uri.parse(Helper.applicationTrackApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };
    var bodyData = {
      'student_id': userId.toString(),
    };

    try {
      final response = await http.post(url,body: bodyData, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");
        TrackAppModel trackAppModel = TrackAppModel.fromJson(json.decode(response.body));

        if(trackAppModel.data != null && trackAppModel.data!.isNotEmpty){
          applications.addAll(trackAppModel.data!);
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
}