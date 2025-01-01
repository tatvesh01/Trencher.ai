import 'dart:convert';
import 'package:eductrl/Models/CourseModel.dart';
import 'package:eductrl/Models/FilterOptionModel.dart';
import 'package:eductrl/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/DisplineAreaModel.dart';
import '../Utils/helper.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Utils/sPHelper.dart';

class CourseFinderScreenController extends GetxController{

  var dropdownValue1 = 'Select Country'.obs;
  //var dropdownValue2 = 'Select Campus/City'.obs;
  var dropdownValue3 = 'Select Study Level'.obs;
  var dropdownValue4 = 'Select Intake'.obs;
  var dropdownValue5 = 'Select Study Area'.obs;
  var dropdownValue6 = 'Select Discipline Area'.obs;
  var dropdownValue7 = 'Select Duration'.obs;
  var textFieldValue = ''.obs;
  String errorText = '';

  RxBool isLoading = false.obs;
  bool searchPressed = false;
  ScrollController scrollController = ScrollController();

  List<String> dropdownOption1 = ['Select Country'];
  List<int> dropdownOption1Ids = [55555555];
  //List<String> dropdownOption2 = ['Select Campus/City'];
  List<String> dropdownOption3 = ['Select Study Level'];
  List<String> dropdownOption4 = ['Select Intake',"January","February","March","April","May","June","July","August","September","October","November","December","Spring","Summer","Fall","Winter"];
  List<String> dropdownOption5 = ['Select Study Area'];
  List<int> dropdownOption5Ids = [55555555];
  List<String> dropdownOption6 = ['Select Discipline Area'];
  List<String> dropdownOption7 = ['Select Duration',"0-1 year","1-2 years","2-3 years","3-4 years","4+ years"];


  List<Datum> courses = <Datum>[].obs;
  RxString screenTitle = "".obs;

  @override
  void onInit() {
    getFilterDataApi();
    super.onInit();
  }


  getFilterDataApi() async{

    screenTitle.value = Get.arguments[0];
    isLoading.value = true;

    Uri url = Uri.parse(Helper.getFilterDataApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");

        var jsonData = jsonDecode(response.body);
        //Map<String, dynamic> countryData = jsonData["data"]["countries"];
        Map<String, dynamic> studyLevelData = jsonData["data"]["study_levels"];

        /*for (var value in countryData.values) {
          dropdownOption1.add(value);
        }*/
        for (var value in studyLevelData.values) {
          dropdownOption3.add(value);
        }

        FilterOptionModel filterOptionModel = FilterOptionModel.fromJson(jsonDecode(response.body));
        filterOptionModel.data!.universityCourseCategories!.forEach((element) {
          dropdownOption5.add(element.title ?? "");
          dropdownOption5Ids.add(element.id ?? 55555555);
        });

        filterOptionModel.data!.studyCountries!.forEach((element) {
          dropdownOption1.add(element.name ?? "");
          dropdownOption1Ids.add(element.id ?? 55555555);
        });


      } else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }

  getDiscAreaFilterDataApi() async{
    isLoading.value = true;

    Uri url = Uri.parse(Helper.getFilterDataApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");

        var jsonData = jsonDecode(response.body);
        Map<String, dynamic> countryData = jsonData["data"]["countries"];

        for (var value in countryData.values) {
          dropdownOption1.add(value);
        }

      } else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }

  getCourseApi() async{
    searchPressed = true;
    isLoading.value = true;

    String intakeValue = "";
    if(dropdownValue4.value != "Select Intake"){
      intakeValue = dropdownValue4.value;
    }

    String discAreaValue = "";
    if(dropdownValue6.value != "Select Discipline Area"){
      discAreaValue = dropdownValue6.value;
    }

    String durationValue = "";
    if(dropdownValue7.value == "Select Duration"){
      durationValue = "";
    }else{
      if(dropdownValue7.value == "0-1 year"){
        durationValue = "12";
      }else if(dropdownValue7.value == "1-2 years"){
        durationValue = "24";
      }else if(dropdownValue7.value == "2-3 years"){
        durationValue = "36";
      }else if(dropdownValue7.value == "3-4 years"){
        durationValue = "48";
      }else if(dropdownValue7.value == "4+ years"){
        durationValue = "60";
      }else{
        durationValue = "";
      }
    }

    int tempData = dropdownOption1.indexWhere((element) => element == dropdownValue1.value);
    int countryId = dropdownOption1Ids[tempData];
    
    
    String courseUniValue = "";
    if(textFieldValue.value != ""){
      courseUniValue = textFieldValue.value;
    }

    Uri url = Uri.parse(Helper.getUnivercityCourseApi+"?course_university_search=${courseUniValue}&country=${countryId}&universities=&study_level=${dropdownValue3.value}&duration=${durationValue}&subcategory=&category=&campus=&ielts=&ielts_no_band=&toefl=&toefl_no_band=&pte=&pte_no_band=&gre=&gmat=&sort_by=&get_search=");

    var headers = {
      'apikey': Helper.headerApiKey
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");
        CourseModel courseModel = CourseModel.fromJson(json.decode(response.body));
        courses.clear();
        if(courseModel.data != null && courseModel.data!.isNotEmpty){
          courses.addAll(courseModel.data!);
        }
      } else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
      scrollToTop();
    }

  }

  getDisplinAreaOptions(int catId) async{
    isLoading.value = true;

    Uri url = Uri.parse(Helper.disciplineAreaApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };
    var bodyData = {
      'category_id': catId.toString(),
    };

    try {
      final response = await http.post(url,body: bodyData, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");
        DisplineAreaModel displineAreaModel = DisplineAreaModel.fromJson(json.decode(response.body));
        dropdownOption6.clear();
        dropdownOption6.add("Select Discipline Area");
        dropdownValue6 = 'Select Discipline Area'.obs;

        if(displineAreaModel.data != null && displineAreaModel.data!.isNotEmpty){
          for (int i = 0; i < displineAreaModel.data!.length; i++) {
            dropdownOption6.add(displineAreaModel.data![i].title!);
          }
        }
      }else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }

  addBookMark(int courseId, Datum cours, String intakeValue) async{
    isLoading.value = true;
    int userId = await SPHelper.getUserId();

    Uri url = Uri.parse(Helper.addBookMarkApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };

    var bodyData = {
      'user_id': userId.toString(),
      'preference_course_id': courseId.toString(),
      'course_preference_country': cours.country,
      'course_preference_uni': cours.university.toString(),
      'intake': intakeValue,
    };

    try {
      final response = await http.post(url,body: bodyData, headers: headers);
      debugPrint("response.body ==> ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        Global.showToast("Course Bookmarked.");
      }else if (response.statusCode == 409) {
        Global.showToast("Course Already Bookmarked.");
      } else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitForm() async {

    if(dropdownValue1.value == "Select Country"){
      errorText = "Select Country";
    }/*else if(dropdownValue2.value == "Select Campus/City"){
      errorText = "Select Campus/City";
    }*/else if(dropdownValue3.value == "Select Study Level"){
      errorText = "Select Study Level";
    }/*else if(dropdownValue4.value == "Select Intake"){
      errorText = "Select Intake";
    }else if(dropdownValue5.value == "Select Study Area"){
      errorText = "Select Study Area";
    }else if(dropdownValue6.value == "Select Discipline Area"){
      errorText = "Select Discipline Area";
    }else if(dropdownValue7.value == "Select Duration"){
      errorText = "Select Duration";
    }else if(textFieldValue.value == ""){
      errorText = "Enter Course/University";
    }*/else{
      errorText = "";
    }

    if(errorText == ""){
      getCourseApi();
    }else{
      Global.showToast("Please ${errorText} First");
    }
  }

  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        Global.sHeight-100,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /*bookMarkApiCall(int index,bool value){
    //courses[index].bookMarked = value;
    isLoading(true);
    isLoading(false);
  }*/

  void showMonthDropdownDialog(BuildContext context,int courseId, Datum cours) {
    //String? selectedMonth;
    DateTime? selectedDate;

    //List<String> months = _generateNext24Months();
    List<DateTime> months = _generateNext24Months();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Helper.whiteColor,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10,),
                  Text('Choose Intake',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Helper.greyColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<DateTime>(
                      isExpanded: true,
                      underline: SizedBox(),
                      value: selectedDate,
                      hint: Text('Choose Intake',),
                      items: months.map((DateTime month) {
                        return DropdownMenuItem<DateTime>(
                          value: month,
                          child: Text(DateFormat('MMMM yyyy').format(month)),
                        );
                      }).toList(),
                      onChanged: (DateTime? newValue) {
                        setState(() {
                          selectedDate = newValue;
                        });
                      },
                    ),
                    ),

                  SizedBox(height: 15,),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(selectedDate); // Return selected month
                      },
                      child: Container(
                        width: Global.sWidth*0.30,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Helper.darkBlueColor,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child: Text(
                            "OK",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                ],
              );
            },
          ),

        );
      },
    ).then((selectedValue) {
      if (selectedValue != null) {
        String intakeValue = '${selectedValue.month} ${selectedValue.year}';
        addBookMark(courseId,cours,intakeValue);
      }
    });
  }

 /* List<String> _generateNext24Months() {
    List<String> months = [];
    DateTime now = DateTime.now();
    for (int i = 0; i < 24; i++) {
      DateTime date = DateTime(now.year, now.month + i);
      debugPrint("now.month ==> ${now.month + i}");
      String formattedDate = DateFormat('MMMM yyyy').format(date);
      months.add(formattedDate);
    }
    return months;
  }*/

  List<DateTime> _generateNext24Months() {
    List<DateTime> months = [];
    DateTime now = DateTime.now();
    for (int i = 0; i < 24; i++) {
      DateTime date = DateTime(now.year, now.month + i);
      months.add(date);
    }
    return months;
  }

}