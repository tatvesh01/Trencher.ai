import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

import '../Controller/LoginController.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';
import '../Utils/sPHelper.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helper.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          height: Global.sHeight,
          child: Stack(
            children: [

              /*Positioned(
                  bottom: 0,
                  child: Image.asset(Helper.bottomLpImg,width: Global.sWidth,fit: BoxFit.contain,),
              ),*/

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Image.asset(Helper.iconImg,height: 80,),
                    SizedBox(height: 20),

                    Text(
                      'AI-Powered Study Guidance',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Helper.darkBlueColor,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    SizedBox(height: 10),

                    Text(
                      'Find Your Perfect University Match - Discover top universities worldwide with personalized AI based recommendations.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          color: Helper.lightBlackColor,
                        fontWeight: FontWeight.w500
                      ),
                    ),


                    const SizedBox(height: 40),
                    TextField(
                      controller: loginController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Helper.whiteColor,
                        hintText: "Enter Email Address",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: Global.commonBorderShape,
                        focusedBorder: Global.commonBorderShape,
                        disabledBorder: Global.commonBorderShape,
                      ),
                    ),

                    SizedBox(height: 10),
                    // Subtitle
                    Text(
                      'We will send you an One Time Password on this Email Address.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Helper.lightBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Next Button
                    ElevatedButton(
                      onPressed: () {
                        String emailAddress = loginController.emailController.text.trim();
                        if (emailAddress.isEmpty || !Global.isValidEmail(emailAddress)) {
                          Global.showToast('Please enter a valid Email Address');
                        } else {
                          loginController.sendOtpApi();
                          //Get.to(()=>OtpScreen(),arguments: [loginController.emailController.text.trim(), "123", true]);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Helper.darkBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(Helper.bottomLpImg,width: Global.sWidth,fit: BoxFit.contain,),
                  ],
                ),
              ),


              Obx(() => loginController.isLoading.value?
              Center(child: Global.showProgressBar(),):SizedBox())


            ],
          ),
        ),
      ),
    );
  }
}
