import 'package:eductrl/Ui/fill_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/OtpScreenController.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';

class OtpScreen extends StatelessWidget {
  OtpScreenController otpController = Get.put(OtpScreenController());

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
                    SizedBox(height: 15,),
                    // App Name
                    Text(
                      /*otpController.isNewUser ? 'Create Account' : */'Verification Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Helper.blackColor,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      'Please enter the OTP sent to your email ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Helper.lightBlackColor,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          '${otpController.emailAddress} ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Helper.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                            child: Icon(Icons.edit,color: Helper.extraLightBlackColor,size: 18,))
                      ],
                    ),

                    const SizedBox(height: 20),
                    // Country Code and Phone Number
                    Row(
                      children: [
                        Expanded(
                          child:
                          TextField(
                            controller: otpController.otpTxtController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              filled: true,
                              fillColor: Helper.whiteColor,
                              hintText: "Enter Otp",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: Global.commonBorderShape,
                              focusedBorder: Global.commonBorderShape,
                              disabledBorder: Global.commonBorderShape,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Obx(()=>
                    otpController.remainingTime.value != 0?
                       Row(
                        children: [
                          Text(
                            'resend OTP in ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Helper.lightBlackColor,
                            ),
                          ),
                          Text(
                            '${otpController.formatTime()}s',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Helper.blackColor,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ):Align(
                      alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: (){
                            otpController.remainingTime(60);
                            otpController.startTimer();
                            otpController.reSendOtpApi();
                          },
                          child: Text(
                          'Resend OTP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Helper.blackColor,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Next Button
                    ElevatedButton(
                      onPressed: () {
                        String otpNumber = otpController.otpTxtController.text.trim();
                        if (otpNumber.isEmpty) {
                          Global.showToast('Please enter a valid Otp');
                        } else {
                          otpController.verifyOtp();
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
                        'Confirm',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Image.asset(Helper.bottomLpImg,width: Global.sWidth,fit: BoxFit.contain,),
                  ],
                ),
              ),

              Obx(() => otpController.isLoading.value?
              Center(child: Global.showProgressBar(),):SizedBox())

            ],
          ),
        ),
      ),
    );
  }
}
