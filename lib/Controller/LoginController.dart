import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/OtpModel.dart';
import '../Ui/otp_screen.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';
import 'package:http/http.dart' as http;

import '../Utils/sPHelper.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;

  Future<void> sendOtpApi() async {
    isLoading.value = true;

    Uri url = Uri.parse(Helper.otpApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };
    var bodyData = {
      'email': emailController.text.trim()
    };

    try {
      final response = await http.post(url,body: bodyData ,headers: headers);
      if (response.statusCode == 200) {
        OtpModel otpModel = OtpModel.fromJson(json.decode(response.body));
        debugPrint("otpModel.otp ==> ${otpModel.otp}");

        bool isNewUser = false;
        if(otpModel.data == null){
          isNewUser = true;
        }else{
          isNewUser = false;

          SPHelper.setName("${otpModel.data!.firstName ?? ""} ${otpModel.data!.lastName!}");
          SPHelper.setEmail(otpModel.data!.email ?? "");
          SPHelper.setPhone(otpModel.data!.mobile ?? "");
          SPHelper.setUserId(otpModel.data!.id ?? 0);
          SPHelper.setPhoto(otpModel.data!.profilePic ?? "");
        }
        Get.to(()=>OtpScreen(),arguments: [emailController.text.trim(), otpModel.otp.toString(), isNewUser]);

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
