import 'package:eductrl/Controller/PilotScreencontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Common/CommonAppBar.dart';
import '../Controller/CourseFinderScreencontroller.dart';
import '../Controller/StudyAbroadScreencontroller.dart';
import '../Utils/helper.dart';
import '../Utils/global.dart';

class PilotScreen extends StatelessWidget {
  PilotScreen({Key? key}) : super(key: key);

  PilotScreenController pilotScreenController = Get.put(PilotScreenController());

  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      appBar: CommonAppBar(title: "Pilot Program",showBackButton: true,actions: []),
      body: Stack(
        children: [
          Container(
            height: Global.sHeight,
            width: Global.sWidth,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Image
                  Image.asset(
                    Helper.ppMainImg,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            Helper.ppFlagImg,
                            height: 50,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What is Pilot Program?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Helper.darkBlueColor),
                          ),
                          /*Text(
                            "700 Universities",
                            style: TextStyle(color: Helper.greyColor, fontSize: 13,fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "485,645 International Students",
                            style: TextStyle(color: Helper.lightBlackColor, fontSize: 13,fontWeight: FontWeight.w600),
                          ),*/
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 15,),
                  // Tabs
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Helper.darkBlueColor,
                          unselectedLabelColor: Helper.greyColor,
                          indicatorColor: Helper.darkBlueColor,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: "Overview"),
                            Tab(text: "Eligibility"),
                            Tab(text: "FAQs"),
                          ],
                        ),
                        Container(
                          height: 800,
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:  Text.rich(
                                  TextSpan(
                                    text: 'Pilot Training Program with Trencher.ai\n', // non-bold
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Your Dream to Fly Starts Here!\n', // bold
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'Trencher.ai offers an exclusive platform to kickstart your journey toward becoming a certified pilot. Explore and apply for pilot training programs at our globally recognized partner training locations, all in one place. Whether you\'re aspiring to fly commercial airlines or pursue an adventurous career in aviation, Trencher.ai simplifies your path to the skies.\n\n',
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                      ),
                                      TextSpan(
                                        text: 'Why Choose Trencher.ai for Pilot Training?\n', // bold
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                      ),
                                      /*TextSpan(
                                        text: '• Global Training Partners: Access a network of top-tier aviation training schools and academies.\n'
                                            '• Streamlined Application Process: Apply to multiple programs at the click of a button.\n'
                                            '• Tailored Recommendations: AI-powered suggestions for programs and training locations that suit your profile and aspirations.\n'
                                            '• Comprehensive Guidance: End-to-end support, from application submission to course enrolment.\n',
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                      ),*/
                                        TextSpan(
                                          text: '• Global Training Partners: ', // bold bullet point
                                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                              'Access a network of top-tier aviation training schools and academies.\n\n', // regular description
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Streamlined Application Process: ', // bold bullet point
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text:
                                              'Apply to multiple programs at the click of a button.\n\n', // regular description
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Tailored Recommendations: ', // bold bullet point
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text:
                                              'AI-powered suggestions for programs and training locations that suit your profile and aspirations.\n\n', // regular description
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Comprehensive Guidance: ', // bold bullet point
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text:
                                              'End-to-end support, from application submission to course enrolment.\n', // regular description
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:  Text.rich(
                                  TextSpan(
                                    text: '• 12th Standard with Physics, Mathematics, and English.\n'
                                        '• Minimum age: 17 years.\n'
                                        '• Valid Passport\n'
                                        '• Meet medical fitness criteria as per regulatory requirements (e.g., DGCA, FAA, EASA)\n',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Obx(()=>!pilotScreenController.refreshUi.value ? ListView.builder(
                                  itemCount: pilotScreenController.faqList.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    bool isExpanded = pilotScreenController.expandedItems.value == index;
                                    String key = pilotScreenController.faqList.keys.elementAt(index);
                                    Widget value = pilotScreenController.faqList[key]!;

                                    return Card(
                                      elevation: 2,
                                      color: Helper.whiteColor,
                                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text('$key',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                                            trailing: Container(
                                              decoration: BoxDecoration(
                                                  color: Helper.whiteColor,
                                                borderRadius: BorderRadius.circular(7)
                                              ),
                                              child: Icon(
                                                isExpanded ? Icons.expand_less : Icons.expand_more,
                                              ),
                                            ),
                                            onTap: () => pilotScreenController.toggleItem(index),
                                          ),
                                          if (isExpanded)
                                            Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: value
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ):SizedBox()
                                ),
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  pilotScreenController.connectWatsapp();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Helper.darkBlueColor,
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Talk with our Expert for Free",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;

  InfoCard({required this.icon, required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.teal.withOpacity(0.1),
          child: Icon(icon, size: 30, color: Colors.teal),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(sublabel, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
