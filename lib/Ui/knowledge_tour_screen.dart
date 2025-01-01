import 'package:eductrl/Common/CommonAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Controller/KnowledgeTourScreenController.dart';
import '../Utils/global.dart';
import '../Utils/helper.dart';

class KnowledgeTourScreen extends StatelessWidget {
  KnowledgeTourController knowledgeTourController = Get.put(KnowledgeTourController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Knowledge Tourism",
        showBackButton: true,
        actions: [],
      ),
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
                    Helper.ktMainImg,
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
                            Helper.ktFlagImg,
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
                            "What is Knowledge Tourism?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Helper.darkBlueColor),
                          ),
                          
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
                            Tab(child: Text("Overview",style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),),
                            Tab(child: Text("Academic Tour",style: TextStyle(fontSize: 14),textAlign: TextAlign.center),),
                            Tab(child: Text("Industrial Tour",style: TextStyle(fontSize: 14),textAlign: TextAlign.center),),
                          ],
                        ),
                        Container(
                          height: 1600,
                          child: TabBarView(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(height: 5,),

                                    Text.rich(
                                      TextSpan(
                                        text: 'Trencher.ai is proud to introduce Knowledge Tourism, a program dedicated to leveraging the power of travel for education and personal growth. At Knowledge Tourism, we curate unique experiences that blend adventure with learning, enabling participants to explore global cultures while deepening their understanding of the world.',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    Container(
                                        width: Global.sWidth,
                                        alignment: Alignment.center,
                                        child: Image.asset(Helper.ktOverviewMainImg,width: Global.sWidth*0.8,fit: BoxFit.contain,)),
                                    SizedBox(height: 10,),

                                    Text.rich(
                                      TextSpan(
                                        text: 'Through immersive visits to historical sites, museums, and local communities, travelers experience cultural diversity firsthand. The program emphasizes engagement with local traditions, cuisine, and art, offering a comprehensive understanding of different ways of life, enriching both academic and personal development.',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    Container(
                                      width: Global.sWidth,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Academic Tour",
                                        style: TextStyle(fontSize: 22, color: Helper.blackColor,fontWeight: FontWeight.w800,decoration: TextDecoration. underline),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Image.asset(Helper.ktOverviewImg,height: 200,width: Global.sWidth,fit: BoxFit.cover,),
                                    SizedBox(height: 10,),
                                    Text.rich(
                                      TextSpan(
                                        text: '• Academic Tour: ',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Cambridge, Oxford, Toronto, Singapore, Boston & Sydney',
                                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• Female Future Leaders: ',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Cambridge',
                                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 20,),
                                    Container(
                                      width: Global.sWidth,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Industrial Tour",
                                        style: TextStyle(fontSize: 22, color: Helper.blackColor,fontWeight: FontWeight.w800,decoration: TextDecoration. underline),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Image.asset(Helper.ktOverviewImgTwo,height: 200,width: Global.sWidth,fit: BoxFit.cover,),
                                    SizedBox(height: 10,),
                                    Text.rich(
                                      TextSpan(
                                        text: '• Industrial Tour: ',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'London, New York, San Francisco & Tokyo',
                                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: 'Boston, Cambridge, Oxford, Sydney, Singapore, Toronto\n',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "University-level tuition in a range of subjects. Live & learn like an Undergraduate",
                                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Key Facts\n',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "• Ages 13-14 & 16-18 Oxford. Cambridge & Sydney | Ages 15-18 Boston, Toronto | Ages 16- 18 Singapore\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• University of Cambridge, University of Oxford, University of Sydney, NUS, University of Toronto\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• July & A10ugust 2025\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Maximum class size of 10\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• 40 hours of tuition (over 2 weeks)\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Teaching by academics from host Universities | Combines theoretical & practical teaching\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 5,),

                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "13-14",
                                        style: TextStyle(fontSize: 17, color: Helper.blackColor,fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    bulletView("Architecture","Business Management"),
                                    bulletView("Computer Science","Creative Writing"),
                                    bulletView("Economics","Engineering"),
                                    bulletView("International Relations","Law"),
                                    bulletView("Medicine","Natural Sciences"),
                                    bulletView("Physics","Psychology"),
                                    bulletView("Veterinary Sciences",""),

                                    SizedBox(height: 10,),

                                    Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "16-18",
                                            style: TextStyle(fontSize: 17, color: Helper.blackColor,fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            " (*15-18 in Boston & Toronto)",
                                            style: TextStyle(fontSize: 16, color: Helper.blackColor,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),

                                    bulletView("Architecture","Artificial Intelligence"),
                                    bulletView("Biology","Biotechnology"),
                                    bulletView("Business Management","Chemistry"),
                                    bulletView("Coding","Computer Science"),
                                    bulletView("Creative Writing","Criminology"),
                                    bulletView("Economics","Engineering"),
                                    bulletView("English Literature","Female Future Leaders"),
                                    bulletView("Film Studies","History"),
                                    bulletView("International Relations","Law"),
                                    bulletView("Mathematics","Medicine"),
                                    bulletView("Nanotechnology","Philosophy"),
                                    bulletView("Philosophy, Politics","Economics"),
                                    bulletView("Physics","Psychology"),
                                    bulletView("Software Development & AI",""),


                                    SizedBox(height: 15,),
                                    Text(
                                      "Academic Tour",
                                      style: TextStyle(fontSize: 22, color: Helper.blackColor,fontWeight: FontWeight.w800,decoration: TextDecoration.underline),
                                    ),


                                    Text.rich(
                                      TextSpan(
                                        text: 'What Makes The Programme Unique?',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                        children: <TextSpan>[

                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 5,),
                                    Image.asset(Helper.ktOverviewImgThree,height: 160,width: Global.sWidth,fit: BoxFit.cover,),
                                    SizedBox(height: 10,),

                                    Text.rich(
                                      TextSpan(
                                        text: '• Classroom theory and practical workshops',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• 127 nationalities',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• 33% native speakers',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• All teaching by academics from host university',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• 2 x formal dinners',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• Maximum class size of 10',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• Development of personal project',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• 2 x 1:1 member sessions',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• Mentor families of 10 participants, led by a current/past undergraduate of university',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '• Variety of inspiring guest speakers',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                      ),
                                    ),

                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: 'London, New York, San Francisco, Tokyo\n',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "Experiential learning with career guidance from Industry experts",
                                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 5,),
                                    Image.asset(Helper.ktOverviewImgTwo,height: 160,width: Global.sWidth,fit: BoxFit.cover,),

                                    SizedBox(height: 10,),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Key Facts\n',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "• 14-18\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• London, New York, San Francisco, Tokyo\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• July & August\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Maximum class size of 10\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• End-of-course certificate and personal evaluation\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• 1:1 career guidance, project-based learning with industry visits and workshops\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Industry Visits & Interactive Workshops\n',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: "• Learn directly from industry experts\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Real-world project based learning\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Gain behind the scenes insights from global brands\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Explore concepts and share ideas in small groups\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Be guided by experienced project leads who offer insight into their industry.\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),TextSpan(
                                            text: "• Students are also exposed to learnings from industry-leading speakers\n",
                                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                   /* Text(
                                      "Academic Tour",
                                      style: TextStyle(fontSize: 22, color: Helper.blackColor,fontWeight: FontWeight.w800,decoration: TextDecoration. underline),
                                    ),*/

                                    Text.rich(
                                      TextSpan(
                                        text: 'Industrial Tour Subjects Available',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        children: <TextSpan>[

                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 10,),

                                    Text.rich(
                                      TextSpan(
                                        text: 'New York\n',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                          text: 'Columbia University\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                          ),
                                          TextSpan(
                                          text: '• Banking & Finance\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                          ),
                                          TextSpan(
                                          text: '• Business Management\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                          ),
                                          TextSpan(
                                          text: '• Fashion & Design\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                          ),
                                          TextSpan(
                                          text: '• Marketing & Entertainment\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                          ),
                                          TextSpan(
                                          text: '• Media & Journalism\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                          ),
                                        ]
                                      ),
                                    ),

                                    SizedBox(height: 5,),

                                    Text.rich(
                                      TextSpan(
                                          text: 'San Francisco\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text: 'University of California, Berkeley\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                            ),
                                            TextSpan(
                                              text: '• Entrepreneurship\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Software Development & AI\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Global Society & Sustainability\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Marketing & Entertainment\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),

                                          ]
                                      ),
                                    ),

                                    SizedBox(height: 5,),

                                    Text.rich(
                                      TextSpan(
                                          text: 'Tokyo\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text: 'Location TBC\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                            ),
                                            TextSpan(
                                              text: '• Business Management\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Engineering\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Global Society and Sustainability\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Film & Animation\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),

                                          ]
                                      ),
                                    ),

                                    SizedBox(height: 5,),

                                    Text.rich(
                                      TextSpan(
                                          text: 'London\n',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                              text: 'University College London\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                            ),
                                            TextSpan(
                                              text: '• Architecture & Design\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Banking & Finance\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Business Management\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Engineerin\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),

                                            TextSpan(
                                              text: '• Film Studies\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Fine & Digital Art\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Law\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Media & Journalism\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Medicine\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),
                                            TextSpan(
                                              text: '• Software Development & Gaming\n',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                                            ),

                                          ]
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
                  knowledgeTourController.connectWatsapp();
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

  Widget bulletView(String title, String title2){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text('• ${title}',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),maxLines: 1,overflow: TextOverflow.ellipsis,),
        ),
        title2!=""?Expanded(
          child: Text('• ${title2}',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),maxLines: 1,overflow: TextOverflow.ellipsis),
        ):SizedBox()
      ],
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