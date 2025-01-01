import 'package:eductrl/Ui/HomeScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/FillDetailsController.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';
import '../Utils/sPHelper.dart';

class FillDetailsScreen extends StatelessWidget {
  FillDetailsController fillDetailsController = Get.put(FillDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helper.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          height: Global.sHeight,
          child: Obx(() => Stack(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(Helper.iconImg,height: 80,),
                    SizedBox(height: 15,),
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Helper.blackColor,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Country Code and Phone Number


                    TextField(
                      controller: fillDetailsController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        enabled: false,
                        fillColor: Helper.lightGreyColor,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        border: Global.commonBorderShape,
                        focusedBorder: Global.commonBorderShape,
                        disabledBorder: Global.commonBorderShape,
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      controller: fillDetailsController.nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Helper.whiteColor,
                        hintText: "Full Name",
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        border: Global.commonBorderShape,
                        focusedBorder: Global.commonBorderShape,
                        disabledBorder: Global.commonBorderShape,
                      ),
                    ),

                    SizedBox(height: 10,),
                    TextField(
                      controller: fillDetailsController.mobileNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        filled: true,
                        fillColor: Helper.whiteColor,
                        hintText: "mobile number",
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        border: Global.commonBorderShape,
                        focusedBorder: Global.commonBorderShape,
                        disabledBorder: Global.commonBorderShape,
                      ),
                    ),

                    _buildDropdown("Country Interested to Study In",fillDetailsController.dropdownOption1,fillDetailsController.dropdownValue1,true,false,null),
                    _buildDropdown("Interested Study Level",fillDetailsController.dropdownOption3,fillDetailsController.dropdownValue3,true,false,null),
                    _buildDropdown("Nationality",fillDetailsController.dropdownOption4,fillDetailsController.dropdownValue4,true,false,null),

                    const SizedBox(height: 20),

                    RichText(
                      text: TextSpan(
                        text: "By continuing, you agree to our ",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyle(
                              color: Helper.darkBlueColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Global.openPage("https://www.trencher.ai/terms-and-conditions");
                              },
                          ),
                          TextSpan(
                            text: " and ",
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Helper.darkBlueColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Global.openPage("https://www.trencher.ai/privacy-policy");
                              },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Next Button
                    ElevatedButton(
                      onPressed: () {

                        if (fillDetailsController.nameController.text.trim().isEmpty) {
                          Global.showToast('Please enter full name');
                        }else if(fillDetailsController.mobileNumberController.text.trim().isEmpty){
                          Global.showToast('Please enter Mobile Number');
                        }else if(fillDetailsController.mobileNumberController.text.trim().length < 10){
                          Global.showToast('Please enter valid Mobile Number');
                        }else if(fillDetailsController.dropdownValue1.value == "Country Interested to Study In"){
                          Global.showToast('Please select Country Interested to Study In');
                        }else if(fillDetailsController.dropdownValue3.value == "Interested Study Level"){
                          Global.showToast('Please select Interested Study Level');
                        }else if(fillDetailsController.dropdownValue4.value == "Nationality"){
                          Global.showToast('Please select Nationality');
                        } else {
                          fillDetailsController.createUserApi();
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
                        'Sign Up',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),


              fillDetailsController.isLoading.value?
              Center(child: Global.showProgressBar(),):SizedBox()

            ],
          )),
        ),
      ),
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
              child: Container()/*Row(
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
              )*/
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
            decoration: BoxDecoration(
              color: Helper.whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Helper.darkBlueColor)
            ),
            child: DropdownButton<String>(
              value: selectedValue.value,
              isExpanded: true,
              underline: SizedBox(),
              onChanged: (String? newValue) {
                selectedValue.value = newValue!;
              },
              items: options
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
