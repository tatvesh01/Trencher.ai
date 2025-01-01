import 'package:eductrl/Utils/sPHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeScreenController extends GetxController {
  var isLoading = false.obs;
  String userName = "";
  String userEmail = "";
  RxBool refreshDrawer = false.obs;
  RxString image = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getUserData();
    super.onInit();
  }

  void getUserData() async{
    userName = await SPHelper.getName();
    userEmail = await SPHelper.getEmail();
    String tempImage = await SPHelper.getPhoto();
    if(tempImage != "NA"){
      image.value = tempImage;
    }

    debugPrint("image.value ==> ${image.value}");
    refreshDrawer(true);
    refreshDrawer(false);
  }

}