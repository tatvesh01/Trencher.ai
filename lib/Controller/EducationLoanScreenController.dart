import 'package:eductrl/Ui/HomeScreen.dart';
import 'package:eductrl/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Ui/fill_details_screen.dart';
import '../Ui/login_screen.dart';
import '../Utils/sPHelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class EducationLoanScreenController extends GetxController{

  @override
  void onInit() {

    super.onInit();
  }

  String degree = "";
  String intake = "";
  String amount = "";
  String country = "";
  String month = "";
  String year = "2024";

  var currentStep = 0.obs;

  final totalSteps = 6;

  Future<void> nextStep() async {
    if (currentStep < totalSteps - 1) {
      currentStep++;
      if(currentStep == 5){
        String email = await SPHelper.getEmail();
        String phone = await SPHelper.getPhone();
        String name = await SPHelper.getName();

        final String message = "Hi,<br>I m ${name},<br>My email: ${email}<br>My Mobile Number: ${phone}<br>Time:${month}, ${year}<br>Country:${country}<br>Amount:${amount}<br>Degree:${degree}<br>Intake:${intake}";
        Global.sendMailApi(message);
      }
    }else{
      Global.showToast("Result pending");
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }




}