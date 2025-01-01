import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Common/CommonAppBar.dart';
import '../Controller/CourseFinderScreencontroller.dart';
import '../Controller/NotificationScreencontroller.dart';
import '../Controller/SortedCourseScreencontroller.dart';
import '../Utils/helper.dart';
import '../Utils/global.dart';

class SortedCourseScreen extends StatelessWidget {
  SortedCourseScreen({Key? key}) : super(key: key);

  SortedCourseScreenController sortedCourseController = Get.put(SortedCourseScreenController());

  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      appBar: CommonAppBar(title: "Shortlisted Courses",showBackButton: true,actions: []),
      body: Obx(() => Stack(
        children: [

          sortedCourseController.courses.isEmpty?
          sortedCourseController.isLoading.value?
          SizedBox(): Container(
            height: Global.sHeight,
            width: Global.sWidth,
            decoration: BoxDecoration(
                color: Helper.lightGreyColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: Text("No Data Found.",style: TextStyle(fontSize: 15,color: Helper.darkBlueColor,fontWeight: FontWeight.w500),)),
          ):

          Container(
            height: Global.sHeight,
            width: Global.sWidth,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:  ListView.builder(
              itemCount: sortedCourseController.courses.length,
              itemBuilder: (context, index) {
                final course = sortedCourseController.courses[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Helper.whiteColor,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Helper.darkBlueColor,width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Helper.greyColor.withOpacity(0.7),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.courseName ?? "",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Helper.darkBlueColor),
                          ),
                          SizedBox(height: 8),

                          /*Text('University: ${course.universityName}', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          Text('Campus: ${course.campus}',  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          Text('Study Level: ${course.studyLevel}',  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          Text('Intake: ${course.intakes}',  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                          Text('Duration: ${course.duration}',  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),*/

                          commonText(Helper.universityIcon,"University","${course.universityName}"),
                          commonText(Helper.studyLevelIcon,"Study Level","${course.studyLevel}"),
                          commonText(Helper.countryIcon,"Country","${course.countryName}"),
                          commonText(Helper.intakeIcon,"Intake","${course.intake} ${course.intakeYear}"),
                          commonText(Helper.durationIcon,"Duration","${course.duration}"),

                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                sortedCourseController.removeBookMark(sortedCourseController.courses[index].id!,index);
                              },
                              child: Container(
                                width: Global.sWidth*0.25,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Helper.darkBlueColor,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Center(
                                  child: Text(
                                    "Remove",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),/*ElevatedButton(
                                    onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                    ),
                                    child: Text('Bookmark'),
                                  ),*/
                          ),
                        ],
                      ),
                    ),
                  ),
                ); },

    /*return CourseTile(
                  title: course["title"]!,
                  duration: course["duration"]!,
                  univercity: course["univercity"]!,
                  fee: course["fee"]!,
                  imageUrl: course["image"]!,
                  sortedCourseController: sortedCourseController,
                );*/

            ),
          ),

          sortedCourseController.isLoading.value? Center(child: CircularProgressIndicator()):SizedBox()

        ],
      )),
    );
  }


  Widget commonText(String icon,String label,String value){
    return Column(
      children: [
        SizedBox(height: 3,),
        Row(
          children: [
            Image.asset(icon,color: Helper.darkBlueColor,height: 20,width: 20,),
            SizedBox(width: 8,),
            Text('${label}: ',  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Helper.darkBlueColor)),
            Text('${value}',  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Helper.darkBlueColor)),
          ],
        ),
        SizedBox(height: 5,),
      ],
    );
  }

}
class CourseTile extends StatelessWidget {
  final String title;
  final String duration;
  final String univercity;
  final String fee;
  final String imageUrl;
  SortedCourseScreenController sortedCourseController;

   CourseTile({
    required this.title,
    required this.duration,
    required this.univercity,
    required this.fee,
    required this.imageUrl,
    required this.sortedCourseController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Helper.whiteColor,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 5),
          child: Column(
            children: [
              Row(
                children: [
                  /*ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),*/
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          univercity,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Helper.lightBlackColor
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Fees: "+fee,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              "  |  ",
                              style: TextStyle(
                                fontSize: 12,
                                color: Helper.blackColor,
                              ),
                            ),
                            Text(
                              "Duration: "+duration,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  /*Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.arrow_forward_ios, size: 16, color: Helper.blackColor),
                  ),*/
                ],
              ),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    //sortedCourseController.removeBookMark(sortedCourseController.courses[index].id!);
                  },
                  child: Container(
                    width: Global.sWidth*0.25,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Helper.darkBlueColor,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Text(
                        "Remove",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }