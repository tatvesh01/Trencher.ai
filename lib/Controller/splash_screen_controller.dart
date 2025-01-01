import 'package:eductrl/Ui/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Ui/login_screen.dart';
import '../Utils/global.dart';
import '../Utils/sPHelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    SPHelper.sharedPrefInit();
    redirectScreen();
    super.onInit();
  }

  void redirectScreen() async{
    String? fcmToken = await getFCMToken();
    if(fcmToken != null){
      Global.myFcmToken = fcmToken;
      debugPrint("fcmToken ==> ${fcmToken}");
    }
    Future.delayed(const Duration(seconds: 2), () async {
      bool isLogedIn = await SPHelper.getLogedIn();
      if(isLogedIn){
        Get.offAll(()=>HomeScreen());
      }else{
        Get.off(()=>LoginScreen());
      }
    });
  }

  Future<String?> getFCMToken() async{
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }

}