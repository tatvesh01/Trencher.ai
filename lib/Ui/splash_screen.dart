import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/helper.dart';
import '../Controller/splash_screen_controller.dart';
import '../Utils/global.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      body: Container(
        height: Global.sHeight,
        width: Global.sWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [

            Positioned(
                top: -45,
                right: -45,
                child: Global.roundBubble()
            ),

            Positioned(
              bottom: 0,
              child: Image.asset(Helper.bottomLpImg,width: Global.sWidth,fit: BoxFit.contain,),
            ),

            Positioned(
              top: Global.sHeight*0.42,
              child: Image.asset(Helper.iconImg,width: Global.sWidth*0.7),
            ),

          ],
        ),
      ),
    );
  }
}
