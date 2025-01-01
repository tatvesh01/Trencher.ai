import 'package:eductrl/Ui/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Ui/fill_details_screen.dart';
import '../Ui/login_screen.dart';
import '../Utils/global.dart';
import '../Utils/sPHelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PilotScreenController extends GetxController{

  Map<dynamic,dynamic> faqList = {};
  RxBool refreshUi = false.obs;
  RxInt expandedItems = 5555.obs;

  @override
  void onInit() {

    faqList = {
      "Benefits of Joining Through Trencher.ai":Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint(
            'Verified Programs',
            'Only the best-certified training academies make it to our platform.',
          ),
          SizedBox(height: 16),
          _buildBulletPoint(
            'Transparent Costs',
            'Get a clear breakdown of training fees and additional expenses.',
          ),
          SizedBox(height: 16),
          _buildBulletPoint(
            'Flexible Payment Options',
            'Explore financial assistance and education loans through our financing partners.',
          ),
          SizedBox(height: 16),
          _buildBulletPoint(
            'Student Community',
            'Connect with fellow aspirants and share experiences through the Trencher.ai student network.',
          ),
        ],
      ),
      "Career Pathways After Certification":Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint(
            'Commercial Airlines',
            'Become a pilot for leading airlines worldwide.',
          ),
          SizedBox(height: 16),
          _buildBulletPoint(
            'Private Aviation',
            'Fly luxury charters or corporate jets.',
          ),
          SizedBox(height: 16),
          _buildBulletPoint(
            'Flight Instructor',
            'Train the next generation of pilots.',
          ),
          SizedBox(height: 16),
          _buildBulletPoint(
            'Specialized Roles',
            'Explore opportunities in aerial surveys, cargo flights, or emergency services.',
          ),
        ],
      )
    };

    super.onInit();
  }

  Widget _buildBulletPoint(String title, String description) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "• "+title+": ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  void toggleItem(int index) {
    if(expandedItems.value == index){
      expandedItems.value = 5555;
    }else{
      expandedItems.value = index;
    }
    refreshUi(true);
    refreshUi(false);
  }

  connectWatsapp() async {

    String email = await SPHelper.getEmail();
    String phone = await SPHelper.getPhone();
    String name = await SPHelper.getName();

    final String message = "Hi, I m ${name},\nMy email ${email}\nMy Mobile Number ${phone}\n I want to know more about Pilot program.";
    final String whatsappUrl = "https://wa.me/${Global.mobileNumber}?text=${Uri.encodeComponent(message)}";
    if (!await launchUrl(Uri.parse(whatsappUrl))) {
    throw Exception('Could not launch ');
    }
  }
}