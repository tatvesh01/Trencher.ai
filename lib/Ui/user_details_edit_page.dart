import 'package:eductrl/Common/CommonAppBar.dart';
import 'package:eductrl/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controller/user_details_edit_controller.dart';
import '../Utils/helper.dart';

class UserDetailsEditPage extends StatelessWidget {
  UserDetailsEditPage({Key? key}) : super(key: key);
  UserDetailsEditController userDetailsEditController = Get.put(UserDetailsEditController());

  @override
  Widget build(BuildContext context) {
    userDetailsEditController.tempContext = context;
    return Scaffold(
      backgroundColor: Helper.whiteColor,
        appBar: CommonAppBar(title: "Edit Profile",showBackButton: true,actions: []),
      body: Obx(()=> Container (
        width: Global.sWidth,
        height: Global.sHeight,
        child: !userDetailsEditController.refreshData.value ? mainFullScreenContainer(context): SizedBox(),
      )),
    );
  }

  Widget mainFullScreenContainer(BuildContext context) {
    return Container(
      height: Global.sHeight,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Obx(() => Container(
                      height: 120,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.black12, shape: BoxShape.circle,
                        border: Border.all(width: 5,color: Helper.darkBlueColor),),
                      child: userDetailsEditController.rxImageSelection.value.path.isNotEmpty
                          ? Container(
                              height: 120,
                              width: 120,
                              child: ClipOval(child: Image.file(userDetailsEditController.rxImageSelection.value, fit: BoxFit.cover)),
                            )
                          : userDetailsEditController.image.value.isNotEmpty
                              ? Container(
                                  height: 120,
                                  width: 120,
                                  child: ClipOval(
                                    child: Image.network(userDetailsEditController.image.value, fit: BoxFit.cover),
                                  ),
                                )
                              : ClipOval(child: Image.asset(Helper.userIcon),),
                    )),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: InkWell(
                      onTap: () {
                        showChoiceDialog(context,isOpenGalery: (isGallery){
                          if(isGallery){
                            userDetailsEditController.openGallery(context);
                          }else{
                            userDetailsEditController.openCamera(context);
                          }
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(width: 2,color: Colors.black),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                        child: Icon(Icons.edit, size: 15),
                      ),
                    ))
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    child: TextFormField(
                      controller: userDetailsEditController.fullName,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                      ],
                      scrollPadding: EdgeInsets.only(top: 25),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Helper.whiteColor,
                        focusColor: Colors.white,
                        focusedBorder: Global.commonBorderShape,
                        border: Global.commonBorderShape,
                        enabledBorder: Global.commonBorderShape,
                        hintText: "Full name",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                        counter: Offstage(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 60,
                    child: TextFormField(
                      controller: userDetailsEditController.mobileNumberController,
                      keyboardType: TextInputType.phone,
                      scrollPadding: EdgeInsets.only(top: 25),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Helper.whiteColor,
                        focusColor: Colors.white,
                        focusedBorder: Global.commonBorderShape,
                        border: Global.commonBorderShape,
                        enabledBorder: Global.commonBorderShape,
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                        counter: Offstage(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  userDetailsEditController.loadUi.value == true ? CircularProgressIndicator() : InkWell(
                    onTap: () {
                      if(userDetailsEditController.fullName.text.trim().isEmpty){
                        Global.showToast("Please enter full name");
                      }else if(userDetailsEditController.mobileNumberController.text.trim().isEmpty) {
                        Global.showToast("Please enter mobile number");
                      }else if(userDetailsEditController.mobileNumberController.text.trim().length < 10) {
                        Global.showToast("Please enter valid mobile number");
                      }else {
                        userDetailsEditController.updateUserDataApi();
                      }
                    },
                    child: Container(
                      width: Global.sWidth*0.45,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Helper.darkBlueColor,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }


  Future<void> showChoiceDialog(BuildContext context,{required Function(bool) isOpenGalery}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return  AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: Container(
              height: 50,
              color: Helper.darkBlueColor,
              width: double.infinity,
              alignment: Alignment.center,
              child:  const Text("Complete action using",
                  style: TextStyle(color: Colors.white)),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Helper.darkBlueColor)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_library_outlined,size: 30),
                        SizedBox(height: 5),
                        Text("Gallery")
                      ],
                    ),
                  ),
                  onTap: (){
                    isOpenGalery(true);
                  },
                ),
                InkWell(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Helper.darkBlueColor)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_camera_back_outlined,size: 30),
                        SizedBox(height: 5),
                        Text("Camera")
                      ],
                    ),
                  ),
                  onTap: (){
                    isOpenGalery(false);
                  },
                )
              ],
            ),
          );
        });
  }
}
