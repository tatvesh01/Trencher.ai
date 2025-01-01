import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/FilterOptionModel.dart';
import '../Models/UserRegisterModel.dart';
import '../Ui/HomeScreen.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';
import '../Utils/sPHelper.dart';

class FillDetailsController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var dropdownValue1 = 'Country Interested to Study In'.obs;
  var dropdownValue3 = 'Interested Study Level'.obs;
  var dropdownValue4 = 'Nationality'.obs;
  List<String> dropdownOption1 = ['Country Interested to Study In'];
  List<int> dropdownOption1Ids = [55555555];
  List<String> dropdownOption3 = ['Interested Study Level'];
  List<String> dropdownOption4 = ['Nationality'];
  List<int> dropdownOption4Ids = [55555555];

  String emailAddress = "";
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    emailAddress = Get.arguments[0];
    emailController.text = emailAddress;
    getFilterDataApi();
    super.onInit();
  }


  Future<void> createUserApi() async {
    isLoading.value = true;

    int tempData = dropdownOption1.indexWhere((element) => element == dropdownValue1.value);
    int countryId = dropdownOption1Ids[tempData];

    int tempData2 = dropdownOption4.indexWhere((element) => element == dropdownValue4.value);
    int nationalityId = dropdownOption4Ids[tempData2];

    Uri url = Uri.parse(Helper.newUserApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };
    var bodyData = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'mobile': mobileNumberController.text.trim(),
      'country_interested[]': dropdownValue1.value,
      'nationality': nationalityId.toString(),
      'study_level': dropdownValue3.value,
    };

    try {
      final response = await http.post(url,body: bodyData ,headers: headers);
      debugPrint("response.body ==> ${response.body}");
      if (response.statusCode == 200) {
        UserRegisterModel userRegisterModel = UserRegisterModel.fromJson(json.decode(response.body));

        SPHelper.setLogedIn(true);
        SPHelper.setUserId(userRegisterModel.data!.id!);
        SPHelper.setName(nameController.text.trim());
        SPHelper.setEmail(emailController.text.trim());
        SPHelper.setPhone(mobileNumberController.text.trim());
        Get.offAll(()=>HomeScreen());

      } else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
      isLoading.value = false;
    }
  }

  getFilterDataApi() async{

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

        filterOptionModel.data!.studyCountries!.forEach((element) {
          dropdownOption1.add(element.name ?? "");
          dropdownOption1Ids.add(element.id ?? 55555555);
        });

        filterOptionModel.data!.nationality!.forEach((element) {
          dropdownOption4.add(element.name ?? "");
          dropdownOption4Ids.add(element.id ?? 55555555);
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

}
