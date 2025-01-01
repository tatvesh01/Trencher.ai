import 'package:eductrl/Ui/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Ui/fill_details_screen.dart';
import '../Ui/login_screen.dart';
import '../Utils/global.dart';
import '../Utils/sPHelper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class KnowledgeTourController extends GetxController{
  RxBool refreshUi = false.obs;

  @override
  void onInit() {

    super.onInit();
  }

  connectWatsapp() async {

    String email = await SPHelper.getEmail();
    String phone = await SPHelper.getPhone();
    String name = await SPHelper.getName();

    final String message = "Hi, I m ${name},\nMy email ${email}\nMy Mobile Number ${phone}\n I want to know more about Knowledge Tourism.";
    final String whatsappUrl = "https://wa.me/${Global.mobileNumber}?text=${Uri.encodeComponent(message)}";
    if (!await launchUrl(Uri.parse(whatsappUrl))) {
      throw Exception('Could not launch ');
    }
  }
}