import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/OtpModel.dart';
import '../Ui/HomeScreen.dart';
import '../Ui/fill_details_screen.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';
import '../Utils/sPHelper.dart';

class OtpScreenController extends GetxController {
  TextEditingController otpTxtController = TextEditingController();

  String emailAddress = "";
  String verificationId = "";
  bool isNewUser = false;
  RxInt remainingTime = 60.obs;
  late Timer _timer;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    emailAddress = Get.arguments[0];
    verificationId = Get.arguments[1];
    isNewUser = Get.arguments[2];
    startTimer();
    super.onInit();
  }


  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime--;
      } else {
        _timer.cancel();
      }
    });
  }


  String formatTime() {
    final minutes = (remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingTime % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  verifyOtp(){
    if(verificationId == otpTxtController.text.trim().toString()){
      if(isNewUser){
        Get.to(()=>FillDetailsScreen(),arguments: [emailAddress]);
      }else{
        SPHelper.setLogedIn(true);
        Get.offAll(()=>HomeScreen());
      }
    }else{
      Global.showToast("You have entered wrong otp.");
    }
  }

  Future<void> reSendOtpApi() async {
    isLoading.value = true;

    Uri url = Uri.parse(Helper.otpApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };
    var bodyData = {
      'email': emailAddress
    };

    try {
      final response = await http.post(url,body: bodyData ,headers: headers);

      if (response.statusCode == 200) {
        OtpModel otpModel = OtpModel.fromJson(json.decode(response.body));
        verificationId = otpModel.otp.toString();
      } else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }

}
