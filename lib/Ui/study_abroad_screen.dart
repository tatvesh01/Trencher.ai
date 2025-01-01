import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Common/CommonAppBar.dart';
import '../Controller/CourseFinderScreencontroller.dart';
import '../Controller/StudyAbroadScreencontroller.dart';
import '../Utils/helper.dart';
import '../Utils/global.dart';

class StudyAbroadScreen extends StatelessWidget {
  StudyAbroadScreen({Key? key}) : super(key: key);

  StudyAbroadScreenController studyAbroadScreenController = Get.put(StudyAbroadScreenController());



  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      appBar: CommonAppBar(title: "Study Abroad",showBackButton: true,actions: []),
      body: Container(
        height: Global.sHeight,
        width: Global.sWidth,
        child:

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

            Text('Study Abroad',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Helper.darkBlueColor,)),
            Text('Static Content Here',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Helper.extraLightBlackColor,)),

          ],
        ),
      ),
    );
  }
}
