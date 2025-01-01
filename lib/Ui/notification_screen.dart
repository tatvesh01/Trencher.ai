import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Common/CommonAppBar.dart';
import '../Controller/CourseFinderScreencontroller.dart';
import '../Controller/NotificationScreencontroller.dart';
import '../Utils/helper.dart';
import '../Utils/global.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  NotificationScreenController notiController = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      appBar: CommonAppBar(title: "Notification",showBackButton: true,actions: []),
      body: Obx(() => Stack(
        children: [
          notiController.notifications.isEmpty?
          notiController.isLoading.value?
          SizedBox():Container(
            height: Global.sHeight,
            width: Global.sWidth,
            decoration: BoxDecoration(
                color: Helper.lightGreyColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: Text("No Data Found.",style: TextStyle(fontSize: 15,color: Helper.darkBlueColor,fontWeight: FontWeight.w500),)),
          ):Container(
            height: Global.sHeight,
            width: Global.sWidth,
            child: ListView.builder(
              itemCount: notiController.notifications.length,
              itemBuilder: (context, index) {
                final notification = notiController.notifications[index];
                return NotificationTile(
                  title: notification.title ?? "",
                  description: notification.detail ?? "",
                  time: notification.createdAt.toString(),
                  venue: "",
                  link: "",
                );
              },
            ),
          ),

          notiController.isLoading.value? Center(child: CircularProgressIndicator()):SizedBox()

        ],
      ))
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String venue;
  final String link;

  const NotificationTile({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
    required this.venue,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Helper.whiteColor,
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Helper.darkBlueColor,
            child: Icon(Icons.notifications, color: Colors.white),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              description != ""?
              Text(description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Helper.darkBlueColor),maxLines: 5,):SizedBox(),
              description != ""?
              SizedBox(height: 5,):SizedBox(),
              /*if(link != "null")
              InkWell(
                onTap: () async{
                  final String url = link;
                  if (!await launchUrl(Uri.parse(url))) {
                  throw Exception('Could not launch ');
                  }
                },
                  child: Text(link,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Helper.lightBlueColor,decoration: TextDecoration.underline),)),

              SizedBox(height: 5,),

              Text("Venue: "+venue,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Helper.blackColor),),

              SizedBox(height: 4),*/
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}