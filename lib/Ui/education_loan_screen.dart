import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Common/CommonAppBar.dart';
import '../Controller/EducationLoanScreenController.dart';
import '../Utils/helper.dart';
import '../Utils/global.dart';
import '../Utils/sPHelper.dart';

class EducationLoanScreen extends StatelessWidget {
  EducationLoanScreen({Key? key}) : super(key: key);

  EducationLoanScreenController educationLoanScreenController = Get.put(EducationLoanScreenController());


  final List<Widget> pages = [
    StepWidget(
      step: 1,
      question: "Which country do you wish to study in?",
      options: [
        "US",
        "UK",
        "Australia",
        "Canada",
        "Ireland",
        "India",
        "Other",
      ],
      hasImages: true,

    ),
    StepWidget(
      step: 2,
      question: "Which degree level do you want to pursue?",
      options: [
        "UG (Undergraduate)",
        "PG (Postgraduate)",
      ],
    ),
    StepWidget(
      step: 3,
      question: "Which intake do you want to go for?",
      options: [],
      customWidget: IntakePicker(),
    ),
    StepWidget(
      step: 4,
      question: "What’s your admission status?",
      options: [
        "I’ve received an offer letter",
        "I’ve already filled an application",
        "I am yet to apply",
      ],
    ),
    StepWidget(
      step: 5,
      question: "Please specify the amount of loan you require.",
      options: [
        "Under ₹10 Lakhs",
        "₹10-25 Lakhs",
        "₹25-50 Lakhs",
        "₹50 Lakhs+",
      ],
    ),
    StepWidget(
      step: 6,
      question: "",
      options: [
      ],
      customWidget:  Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        decoration: BoxDecoration(
            color: Helper.whiteColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Helper.greyColor.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(1, 3),
              ),
            ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title and Description
            Text(
              "Congratulations, your chances of getting a loan are moderate*",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Our loan expert will connect with you shortly",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Loan Info Cards

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Helper.whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Helper.greyColor.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset(Helper.elMoneyIcon,)),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Loan amount upto",style: TextStyle(color: Helper.extraLightBlackColor),),
                      Text(
                        "₹1 Crores",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Helper.whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Helper.greyColor.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset(Helper.elDiscountIcon,)),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Interest rate starting",style: TextStyle(color: Helper.extraLightBlackColor),),
                      Text(
                        "11.5%",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Helper.whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Helper.greyColor.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 65,
                      width: 65,
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Helper.yellowColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset(Helper.elTimerIcon,)),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Minimum processing time",style: TextStyle(color: Helper.extraLightBlackColor),),
                      Text(
                        "7 days",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),


            SizedBox(height: 20),

            // Terms and Conditions
            Text(
              "*Subject to Terms and Conditions",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 10),

            SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*Expanded(
                  child: InkWell(
                    onTap: () async{

                      String email = await SPHelper.getEmail();
                      String phone = await SPHelper.getPhone();
                      String name = await SPHelper.getName();

                      EducationLoanScreenController educationLoanScreenController = Get.put(EducationLoanScreenController());
                      final String message = "Hi,<br>I m ${name},<br>My email: ${email}<br>My Mobile Number: ${phone}<br>Time:${educationLoanScreenController.month}, ${educationLoanScreenController.year}<br>Country:${educationLoanScreenController.country}<br>Amount:${educationLoanScreenController.amount}<br>Degree:${educationLoanScreenController.degree}<br>Intake:${educationLoanScreenController.intake}";
                      Global.sendMailApi(message);

                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Helper.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Helper.darkBlueColor,width: 2)
                      ),
                      child: Text(
                        "Send Inquiry",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Helper.darkBlueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),*/
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      String email = await SPHelper.getEmail();
                      String phone = await SPHelper.getPhone();
                      String name = await SPHelper.getName();

                      EducationLoanScreenController educationLoanScreenController = Get.put(EducationLoanScreenController());
                      final String message = "Hi,\nI m ${name},\nMy email ${email}\nMy Mobile Number ${phone}\nTime:${educationLoanScreenController.month}, ${educationLoanScreenController.year}\nCountry:${educationLoanScreenController.country}\nAmount:${educationLoanScreenController.amount}\nDegree:${educationLoanScreenController.degree}\nIntake:${educationLoanScreenController.intake}";
                      final String whatsappUrl = "https://wa.me/${Global.mobileNumber}?text=${Uri.encodeComponent(message)}";
                      if (!await launchUrl(Uri.parse(whatsappUrl))) {
                        throw Exception('Could not launch ');
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Helper.darkBlueColor,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        "Connect On WhatsApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      appBar: CommonAppBar(title: "Education Loan",showBackButton: true,actions: []),
      body: Container(
        height: Global.sHeight,
        width: Global.sWidth,
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return pages[educationLoanScreenController.currentStep.value];
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if((educationLoanScreenController.currentStep.value != 0 || educationLoanScreenController.currentStep.value == 4) && educationLoanScreenController.currentStep.value != 5)
                  InkWell(
                    onTap: (){
                      educationLoanScreenController.previousStep();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Helper.darkBlueColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(
                        "Previous",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  /*if(educationLoanScreenController.currentStep.value == 4)
                  InkWell(
                    onTap: (){
                      educationLoanScreenController.nextStep();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Helper.darkBlueColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )*/

                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}


class StepWidget extends StatelessWidget {
  final int step;
  final String question;
  final List<String> options;
  final bool hasImages;
  final Widget? customWidget;

  const StepWidget({
    Key? key,
    required this.step,
    required this.question,
    required this.options,
    this.hasImages = false,
    this.customWidget,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    EducationLoanScreenController educationLoanScreenController = Get.put(EducationLoanScreenController());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          educationLoanScreenController.currentStep.value != 5 ? LinearProgressIndicator(
            value: step/100*20,
            color: Helper.darkBlueColor,
            minHeight: 3,
            backgroundColor: Helper.greyColor,
            borderRadius: BorderRadius.circular(10),
          ):SizedBox(),

          SizedBox(height: 10,),

          educationLoanScreenController.currentStep.value != 5?
          Text(
            "Step $step/5",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Helper.greyColor),
          ):SizedBox(),

          SizedBox(height: 16),
          educationLoanScreenController.currentStep.value != 5? Text(
            question,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,),textAlign: TextAlign.center,
          ):SizedBox(),
          SizedBox(height: 32),
          if (customWidget != null)
            customWidget!
          else if (hasImages)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      educationLoanScreenController.country = options[index];
                      educationLoanScreenController.nextStep();
                    },
                    child: Card(
                      elevation: 4,
                      color: Helper.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            child: Image.asset(
                              'assets/images/${options[index].toLowerCase()}.jpg',
                              height: 60,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(options[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          else
            Column(
              children: options
                  .map((option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child:
                InkWell(
                  onTap: (){
                    if(step == 2){
                      educationLoanScreenController.degree = option;
                    }if(step == 4){
                      educationLoanScreenController.intake=option;
                    }if(step == 5){
                      educationLoanScreenController.amount =option;
                    }
                    educationLoanScreenController.nextStep();
                  },
                  child: Container(
                    width: Global.sWidth * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Helper.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Helper.greyColor.withOpacity(0.7),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Helper.darkBlueColor),
                      ),
                    ),
                  ),
                ),

                /*ElevatedButton(
                  onPressed: () {},
                  child: Text(option),
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),*/
              ))
                  .toList(),
            ),
        ],
      ),
    );
  }

}

class IntakePicker extends StatelessWidget {


  var selectedMonth = DateTime.now().month.obs;
  var selectedYear = DateTime.now().year.obs;
  RxBool refresh = false.obs;

  // Change the selected month
  void setMonth(int month) {
    selectedMonth.value = month;
    refresh(true);
    refresh(false);
  }
  void setYear(int year) {
    selectedYear.value = year;
  }
  // Get the full month name
  String getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July',
      'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    EducationLoanScreenController educationLoanScreenController = Get.put(EducationLoanScreenController());


    return Obx(()=>Container(
      height: Global.sHeight*0.4,
      width: Global.sWidth*0.88,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          //border: Border.all(color: Helper.darkBlueColor),
        boxShadow: [
          BoxShadow(
            color: Helper.greyColor,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Year selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  if(selectedYear.value != 2024){
                    setYear(selectedYear.value - 1);
                    educationLoanScreenController.year = selectedYear.value.toString();
                  }
                },
              ),
              Text(
                '${selectedYear.value}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  if(selectedYear.value != 2030){
                    setYear(selectedYear.value + 1);
                    educationLoanScreenController.year = selectedYear.value.toString();
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(height: 1,color: Helper.darkBlueColor,),
          SizedBox(height: 5),
          Expanded(
            child: !refresh.value ? GridView.builder(
              itemCount: 12,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.0,
              ),
              itemBuilder: (context, index) {
                final month = index + 1;
                return GestureDetector(
                  onTap: () {
                    setMonth(month);
                    educationLoanScreenController.month = getMonthName(selectedMonth.value);
                    educationLoanScreenController.nextStep();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:  selectedMonth.value != month
                            ? Colors.white
                            : Helper.darkBlueColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                      getMonthName(month),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedMonth.value == month
                            ? Colors.white
                            : Helper.darkBlueColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ):SizedBox(),
          ),
        ],
      ),
    ));
  }



}