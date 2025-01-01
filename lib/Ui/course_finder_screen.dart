import 'dart:ffi';

import 'package:eductrl/Models/CourseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Common/CommonAppBar.dart';
import '../Controller/CourseFinderScreencontroller.dart';
import '../Utils/helper.dart';
import '../Utils/global.dart';

class CourseFinderScreen extends StatelessWidget {
  CourseFinderScreen({Key? key}) : super(key: key);

  CourseFinderScreenController courseFinderController = Get.put(CourseFinderScreenController());

  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      //appBar: CommonAppBar(title: "Course Finder",showBackButton: true,actions: []),
      appBar: CommonAppBar(title: courseFinderController.screenTitle.value ,showBackButton: true,actions: []),
      body: Obx(() =>  Container(
        height: Global.sHeight,
        width: Global.sWidth,
        padding: EdgeInsets.all(15),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: courseFinderController.scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Find University/Course',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),

                  _buildDropdown("Country",courseFinderController.dropdownOption1,courseFinderController.dropdownValue1,true,false,null),
                  //_buildDropdown("Campus/City",courseFinderController.dropdownOption2,courseFinderController.dropdownValue2,false,false),
                  _buildDropdown("Study Level",courseFinderController.dropdownOption3,courseFinderController.dropdownValue3,true,false,null),
                  _buildDropdown("Intake",courseFinderController.dropdownOption4,courseFinderController.dropdownValue4,false,false,null),
                  _buildDropdown("Study Area",courseFinderController.dropdownOption5,courseFinderController.dropdownValue5,false,true,null),
                  _buildDropdown("Discipline Area",courseFinderController.dropdownOption6,courseFinderController.dropdownValue6,false,false,null),
                  _buildDropdown("Duration",courseFinderController.dropdownOption7,courseFinderController.dropdownValue7,false,false,null),
                  _buildTextField(courseFinderController.textFieldValue),
                  _buildSubmitButton(),
                  SizedBox(height: 10,),

                  courseFinderController.courses.isEmpty?
                  !courseFinderController.searchPressed ?SizedBox():
                  Container(
                    height: 500,
                    width: Global.sWidth,
                    decoration: BoxDecoration(
                      color: Helper.lightGreyColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("No Course Found.",style: TextStyle(fontSize: 15,color: Helper.darkBlueColor,fontWeight: FontWeight.w500),)),
                  ):
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: courseFinderController.courses.length,
                    itemBuilder: (context, index) {
                      final course = courseFinderController.courses[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
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

                          child: courseView(course,index,context),
                        ),
                      ); },
                  ),

                ],
              ),
            ),

            courseFinderController.isLoading.value? Center(child: CircularProgressIndicator()):SizedBox()
          ],
        ),
      )),
    );
  }

  Widget courseView(Datum course,int index, BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.courseName ?? "",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Helper.darkBlueColor),
          ),
          SizedBox(height: 8),
          commonText(Helper.universityIcon,"University","${course.universityName}"),
          commonText(Helper.studyLevelIcon,"Study Level","${course.studyLevel}"),
          commonText(Helper.countryIcon,"Country","${course.countryName}"),
          commonText(Helper.durationIcon,"Duration","${course.duration}"),
          commonText(Helper.intakeIcon,"Intakes","${course.intakes ?? ""}"),
          commonText(Helper.feeIcon,"Application Fee","${course.applicationFee ?? "NA"} ${course.applicationFee != null ? course.currency : ""}"),
          commonText(Helper.feeIcon,"Tuition Fees","${course.yearlyTuitionFee ?? "NA"} ${course.currency}"),

          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                //courseFinderController.addBookMark(courseFinderController.courses[index].id!,courseFinderController.courses[index]);
                courseFinderController.showMonthDropdownDialog(context,courseFinderController.courses[index].id!,courseFinderController.courses[index]);
              },
              child: Container(
                width: Global.sWidth*0.40,
                height: 45,
                decoration: BoxDecoration(
                    color: Helper.darkBlueColor,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Center(
                  child: Text(
                    "Add to Preference",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ),
        ],
      ),
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

  Widget _buildDropdown(String label,List<String> options,RxString selectedValue,bool required,bool makeApiCall, String? iconName) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0,bottom: 5),
              //child: SizedBox(),
            child: Row(
              children: [
                Text(label,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Helper.lightBlackColor),),

                iconName != null ? SizedBox(width: 5,) : SizedBox(),
                iconName != null ? Image.asset(iconName,color: Helper.lightBlackColor,height: 20,width: 20,):SizedBox(),

                required?
                Text(
                  ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ):SizedBox(),
              ],
            )
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
            decoration: BoxDecoration(
              color: Helper.lightGreyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              value: selectedValue.value,
              isExpanded: true,
              underline: SizedBox(),
              onChanged: (String? newValue) {
                selectedValue.value = newValue!;
                if(makeApiCall){
                  int tempData = courseFinderController.dropdownOption5.indexWhere((element) => element == newValue);
                  int tempValue = courseFinderController.dropdownOption5Ids[tempData];
                  courseFinderController.getDisplinAreaOptions(tempValue);
                }
              },
              items: options
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildTextField(RxString textFieldValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
           padding: const EdgeInsets.only(top: 5.0,bottom: 5),
           //child: SizedBox(),
           child: Text('Course/University',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Helper.lightBlackColor),),
         ),

        TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            textFieldValue.value = value;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            filled: true,
            fillColor: Helper.lightGreyColor,
            hintText: "Course/University",
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: Global.commonBorderShape,
            focusedBorder: Global.commonBorderShape,
            disabledBorder: Global.commonBorderShape,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: Global.sWidth,
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        onPressed: () {
           courseFinderController.submitForm();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Helper.darkBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12,),
        ),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
