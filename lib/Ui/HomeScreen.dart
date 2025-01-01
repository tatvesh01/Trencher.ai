import 'package:cached_network_image/cached_network_image.dart';
import 'package:eductrl/Ui/login_screen.dart';
import 'package:eductrl/Ui/pilot_screen.dart';
import 'package:eductrl/Ui/sorted_course_screen.dart';
import 'package:eductrl/Ui/study_abroad_screen.dart';
import 'package:eductrl/Ui/track_application_screen.dart';
import 'package:eductrl/Ui/user_details_edit_page.dart';
import 'package:eductrl/Utils/global.dart';
import 'package:eductrl/Utils/sPHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Controller/HomeScreenController.dart';
import '../Utils/helper.dart';
import 'admission_screen.dart';
import 'course_finder_screen.dart';
import 'education_loan_screen.dart';
import 'knowledge_tour_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Helper.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //title: Global.commonAppName(28),
        title: Image.asset(Helper.iconImg,height: 50,),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(Helper.menuIconImg,height: 25,width: 25,),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active, color: Colors.black),
            onPressed: () {
              Get.to(()=>NotificationScreen());
            },
          ),
        ],
      ),
      drawer: drawerPart(context),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        color: Helper.whiteColor,
        child: Stack(
          children: [

            Positioned(
              bottom: -20,
              child: Image.asset(Helper.bottomHpImg,width: Global.sWidth,fit: BoxFit.contain,),
            ),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTile(Helper.ktHomePageTile,() {
                      Get.to(()=>KnowledgeTourScreen());
                    }),
                    SizedBox(width: 10,),
                    commonTile(Helper.plHomePageTile,() {
                      Get.to(()=>PilotScreen());
                    }),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTile(Helper.adHomePageTile,() {
                      //Get.to(()=>AdmissionScreen());
                      Get.to(()=>CourseFinderScreen(),arguments: ["Admissions"]);
                    }),
                    SizedBox(width: 10,),
                    commonTile(Helper.elHomePageTile,() {
                      Get.to(()=>EducationLoanScreen());
                    }),
                  ],
                ),

                /*commonTile(Helper.ktHomePageTile,"Knowledge Tourism","Information about academic and industry tours.",() {
                    Get.to(()=>KnowledgeTourScreen());
                  }),
                  commonTile(Helper.adHomePageTile,"Admission","Explore global Universities in single click.",() {
                    Get.to(()=>AdmissionScreen());
                  }),
                  commonTile(Helper.plHomePageTile,"Pilot Programs","Universities offering exclusive pilot programs.",() {
                    Get.to(()=>PilotScreen());
                  }),
                  commonTile(Helper.elHomePageTile,"Education Loans","Financial application journey with a dedicated form.",() {
                    Get.to(()=>EducationLoanScreen());
                  }),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget commonTile(String iconsData,Function() callBack){
    return InkWell(
      onTap: () {
        callBack();
      },
      child: Container(
        height: Global.sHeight*0.22,
        width: Global.sWidth*0.45,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
            child: Image.asset(iconsData,fit: BoxFit.fill,cacheHeight: 500,cacheWidth: 500,),
        ),
      ),
    );
  }
  /*Widget commonTile(String iconsData,String title,String subTitle,Function() callBack){
    return InkWell(
      onTap: (){
        callBack();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Helper.darkBlueColor,
          //border: Border.all(width: 2,color: Helper.darkBlueColor),
          boxShadow: [
            BoxShadow(
              color: Helper.greyColor,
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(1, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.asset(iconsData)),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7,),
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Helper.whiteColor,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    subTitle,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Helper.whiteColor,
                    ),
                  ),
                  SizedBox(height: 7,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }*/

  Widget drawerPart(BuildContext context){
    return Drawer(
      backgroundColor: Helper.whiteColor,
      width: Global.sWidth*0.65,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Helper.darkBlueColor,
            ),
            child: Obx(()=>!homeController.refreshDrawer.value ? Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Stack(
                    children: [
                      /*Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.white),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: ClipOval(
                          child: Image.asset(Helper.userIcon),
                        ),
                      ),*/
                      homeController.image.value.isNotEmpty
                          ? Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.white),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: ClipOval(
                          child: Image.network(homeController.image.value, fit: BoxFit.cover),
                        ),
                      )
                          : ClipOval(child: Image.asset(Helper.userIcon),),

                      InkWell(
                          onTap: () {
                            Get.to(()=>UserDetailsEditPage());
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                  border: Border.all(width: 2,color: Colors.black)
                              ),
                              child: Icon(Icons.edit,color: Helper.blackColor,size: 18,),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text(homeController.userName,style: TextStyle(fontWeight: FontWeight.w500,color: Helper.whiteColor),maxLines: 1,),
                Text(homeController.userEmail,style: TextStyle(fontWeight: FontWeight.w500,color: Helper.whiteColor),maxLines: 1)
                // Overlapping badge
              ],
            ):SizedBox()),
          ),

          /*ListTile(
            leading: Icon(Icons.content_paste_search_outlined,color: Helper.darkBlueColor,),
            title: Text('Course Finder',style: TextStyle(fontWeight: FontWeight.w700,color: Helper.darkBlueColor,),maxLines: 1,overflow: TextOverflow.ellipsis,),
            onTap: () {
              Navigator.pop(context);
              Get.to(()=>CourseFinderScreen());
            },
          ),*/

          commonDrawerTile(Icons.content_paste_search_outlined,"Course Finder",() {
            Navigator.pop(context);
            Get.to(()=>CourseFinderScreen(),arguments: ["Course Finder"]);
          }),
          commonDrawerTile(Icons.track_changes,"Track Applications",() {
            Navigator.pop(context);
            Get.to(()=>TrackApplicationScreen());
          }),
          commonDrawerTile(Icons.sort,"Shortlisted Courses",() {
            Navigator.of(context).pop();
            Get.to(()=>SortedCourseScreen());
          }),

          commonDrawerTile(Icons.notifications_active,"Notifications",() {
            Navigator.pop(context);
            Get.to(()=>NotificationScreen());
          }),
          commonDrawerTile(Icons.logout,"Logout",() {
            Navigator.of(context).pop();
            _showLogoutDialog(context);
          }),
        ],
      ),
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Helper.whiteColor,
                borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.logout,
                  size: 60,
                  color: Helper.darkBlueColor,
                ),
                SizedBox(height: 10),
                Text(
                  'Are you sure?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Helper.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Do you want to logout from the application?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Helper.greyColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Helper.whiteColor),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Helper.darkBlueColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        SPHelper.setLogedIn(false);
                        SPHelper.setPhoto("");
                        Get.offAll(()=>LoginScreen());
                      },
                      child: Text('Logout',style: TextStyle(color: Helper.whiteColor),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget commonDrawerTile(IconData icons,String title,Function() callBack){
    return ListTile(
      leading: Icon(icons,color: Helper.darkBlueColor,),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w700,color: Helper.darkBlueColor,),maxLines: 1,overflow: TextOverflow.ellipsis,),
      onTap: () {
        callBack();
      },
    );
  }
}