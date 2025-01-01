import 'package:cached_network_image/cached_network_image.dart';
import 'package:eductrl/Utils/sPHelper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'helper.dart';
import 'package:http/http.dart' as http;


class Global {

  static double sWidth = 0, sHeight = 0;
  static String mobileNumber = "918891188918";
  static String myFcmToken = "";

  static OutlineInputBorder commonBorderShape = OutlineInputBorder(
    borderSide: BorderSide(color: Helper.darkBlueColor,width: 2.0),
    borderRadius: BorderRadius.circular(10),
  );

  static deviceSize(BuildContext context) {
    sWidth = MediaQuery.of(context).size.width;
    sHeight = MediaQuery.of(context).size.height;
  }

  static showToast(String txt) {
    Get.snackbar(
      '',
      "",
      messageText: Text(txt,style: TextStyle(fontWeight: FontWeight.w500,color: Helper.whiteColor),),
      titleText: Container(),
      snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
        backgroundColor: Helper.darkBlueColor
    );
  }

  static Widget networkImage(String url, double height,double width){

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder:  (context, url) => Container(
        height: height,
        width: width,
        color: Helper.lightGreyColor,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }


 static Widget roundBubble(){
    return Stack(
      children: [
        Opacity(
          opacity: 0.20,
          child: Container(
            width: 200, // Width of the circle
            height: 200, // Height
            decoration: BoxDecoration(
              color: Helper.darkBlueColor,
              shape: BoxShape.circle, // Makes it a circle
            ),
          ),
        ),
        Opacity(
          opacity: 0.90,
          child: Container(
            width: 200, // Width of the circle
            height: 200, // Height
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 20,color: Helper.darkBlueColor)
            ),
          ),
        ),
      ],
    );
  }

  static Widget showProgressBar(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }



  static String formatDate(String timestamp) {
    DateTime parsedDateTime = DateTime.parse(timestamp);
    String formattedDate = DateFormat("d MMMM yy HH:mm").format(parsedDateTime);
    return formattedDate;
  }

  static String convertToAgo(String dateTime) {
    DateTime input =
    DateFormat('yyyy-MM-DDTHH:mm:ss.SSSSSSZ').parse(dateTime, true);
    Duration diff = DateTime.now().difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays}d${diff.inDays == 1 ? '' : ''} ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours}h${diff.inHours == 1 ? '' : ''} ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes}m${diff.inMinutes == 1 ? '' : ''} ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds}s${diff.inSeconds == 1 ? '' : ''} ago';
    } else {
      return 'just now';
    }
  }

  static Future<void> openPage(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
    }
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }



  static cameraNStoragePermission() async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    var cameraPermissionCheck = await Permission.camera.status;
    var storagePermissionCheck = deviceInfo.version.sdkInt > 32 ? await Permission.photos.status : await Permission.storage.status;

    if(!cameraPermissionCheck.isGranted) {
      await Permission.camera.request();
    }
    if(!storagePermissionCheck.isGranted) {
      if(deviceInfo.version.sdkInt > 32){
        await Permission.photos.request();
      }else{
        await Permission.storage.request();
      }
    }

    var cameraPermissionCheck1 = await Permission.camera.status;
    var storagePermissionCheck1 = deviceInfo.version.sdkInt > 32 ? await Permission.photos.status : await Permission.storage.status;

    if(!cameraPermissionCheck1.isGranted) {
      await Permission.camera.request();
    }

    if(!storagePermissionCheck1.isGranted) {
      if(deviceInfo.version.sdkInt > 32){
        await Permission.photos.request();
      }else{
        await Permission.storage.request();
      }
    }
  }


  static sendMailApi(String content) async{

    Uri url = Uri.parse(Helper.sendMailApi);
    var headers = {
      'apikey': Helper.headerApiKey
    };
    var bodyData = {
      'data': content,
    };

    try {
      final response = await http.post(url,body: bodyData, headers: headers);

      if (response.statusCode == 200) {
        debugPrint("response.body ==> ${response.body}");
        Global.showToast("Enquiry Sent, we will get back to you within 24 hours.");
      }else {
        Global.showToast("Failed to fetch data.");
      }
    } catch (e) {
      Global.showToast("Something Wrong.");
    } finally {
    }
  }
}
