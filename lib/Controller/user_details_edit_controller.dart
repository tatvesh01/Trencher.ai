import 'dart:convert';
import 'dart:io';
import 'package:eductrl/Controller/HomeScreenController.dart';
import 'package:eductrl/Utils/helper.dart';
import 'package:eductrl/Utils/sPHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/OtpModel.dart';
import '../Utils/global.dart';

class UserDetailsEditController extends GetxController {

  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  late BuildContext tempContext;

  final ImagePicker picker = ImagePicker();
  XFile? imageFile;
  Rx<File> rxImageSelection = File("").obs;
  RxBool refreshData = false.obs;
  Map hostLogininfo = {};
  int userId = 0;
  RxBool loadUi = false.obs;

  String serverImageUrl = "";
  RxString image = "".obs;

  @override
   void onInit() {

    Global.cameraNStoragePermission();
     getHostLoginInfo();
     super.onInit();
   }

   getHostLoginInfo() async {
     image.value = await SPHelper.getPhoto();
     if(image.value == "NA"){
       image.value = "";
     }else{
       image.value = image.value;
     }
     userId = await SPHelper.getUserId();
     fullName.text = await SPHelper.getName();
     mobileNumberController.text =  await SPHelper.getPhone();
     update();
   }

   updateUserDataApi() async {
     loadUi(true);

     Uri url = Uri.parse(Helper.updateProfileApi);
     var headers = {
       'apikey': Helper.headerApiKey
     };
     var bodyData = {
       'user_id': userId.toString(),
       'name': fullName.text.trim(),
       'mobile': mobileNumberController.text.trim()
     };

     try {
       final response = await http.post(url, body: bodyData ,headers: headers);
       if (response.statusCode == 200) {

         SPHelper.setName(fullName.text.trim());
         SPHelper.setPhone(mobileNumberController.text.trim());
         Get.find<HomeScreenController>().getUserData();
       } else {
         Global.showToast("Failed to fetch data.");
       }
     } catch (e) {
       Global.showToast("Something Wrong.");
     } finally {
       loadUi(false);
     }
   }

  /*editUserDataApi() async {
    loadUi(true);

    Map<String, String> jsonBodyData = {
      'user_id': userId,
      'first_name': "${firstName.text}_LC",
      'last_name': "${lastName.text}_LC",
      'email': emailId ?? "",
      'photo': serverImageUrl == "" ? HostgirlPhoto.value : serverImageUrl,
    };

    await ApiCall().apiCall (
        url: ApiUrl.userEdit,
        header: ApiUrl.reqHeader,
        body: jsonBodyData,
        apiType: ApiType.POST,
        isMultiRequest: true,
        onSuccess: (dataClass, status, message) async {

          debugPrint(dataClass.toString());
          if (status) {
            Fluttertoast.showToast(msg: "Details Saved Successfully.");
            HostgirlName = firstName.text + lastName.text;
            HostgirlName = firstName.text + lastName.text;
            HostgirlGmail = dataClass['data'][0]['user']['email'] ?? "";
            HostgirlPhoto.value = dataClass['data'][0]['user']['profile_pic'] ?? "";

            String nameSet = firstName.text + lastName.text;
            await setStringToSP(userEnterNameSP, HostgirlName);
            await setStringToSP(userPicSP, HostgirlPhoto.value ?? "");
            await setStringToSP(userEditFirstNameSP, firstName.text);
            await setStringToSP(userEditLastNameSP, lastName.text);

            final callingController = Get.lazyPut(() => ProfilePageController());
            Get.find<ProfilePageController>().userNameForDisplay.value = nameSet;

            profileUpdate(true);
            profileUpdate(false);
            update();
            Get.back();
            loadUi(false);
          } else {
            Fluttertoast.showToast(msg: message);
          }
        });
    loadUi(true);
    loadUi(false);
  }*/


  void openCamera(BuildContext context)  async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera ,
      imageQuality: 20
    );
    if(pickedFile != null){
      imageFile = pickedFile;
      Navigator.pop(context);

      rxImageSelection = File(imageFile!.path).obs;
      refreshData(true);
      refreshData(false);
      serverImageUrl = await uploadProfileImageForEdit(File(imageFile!.path));
      SPHelper.setPhoto(serverImageUrl);
      Get.find<HomeScreenController>().getUserData();
    }
  }

  void openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery ,
        imageQuality: 20
    );

    if(pickedFile != null) {
      imageFile = pickedFile;
      Navigator.pop(context);
        rxImageSelection = File(imageFile!.path).obs;
        refreshData(true);
        refreshData(false);
        serverImageUrl = await uploadProfileImageForEdit(File(imageFile!.path));
        SPHelper.setPhoto(serverImageUrl);
        Get.find<HomeScreenController>().getUserData();
    }
  }

  Future<String> uploadProfileImageForEdit(File imageFile) async{
    loadUi(true);

    var request = http.MultipartRequest("POST", Uri.parse(Helper.uploadProfilePicApi));

    Map<String, String> headers = {'apikey': Helper.headerApiKey};
    request.headers.addAll(headers);

    request.fields["user_id"] = userId.toString();

    var pic = await http.MultipartFile.fromPath("profile_pic", imageFile.path);

    request.files.add(pic);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    String imgUrl = "";

    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      imgUrl = jsonData["data"]["profile_pic"];

      loadUi(false);
    }else{
      imgUrl = "";
      loadUi(false);
      Fluttertoast.showToast(msg: "Something Wrong,Please Select Image Again.");
    }
    return imgUrl;
  }

}
