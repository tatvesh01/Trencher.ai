import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../Common/CommonAppBar.dart';
import '../Controller/CourseFinderScreencontroller.dart';
import '../Controller/TrackApplicationScreencontroller.dart';
import '../Models/TrackAppModel.dart';
import '../Utils/helper.dart';
import '../Utils/global.dart';

class TrackApplicationScreen extends StatelessWidget {
  TrackApplicationScreen({Key? key}) : super(key: key);

  TrackApplicationScreenController trackAppController = Get.put(TrackApplicationScreenController());

  @override
  Widget build(BuildContext context) {

    Global.deviceSize(context);

    return Scaffold(
      backgroundColor: Helper.whiteColor,
      appBar: CommonAppBar(title: "Track Application",showBackButton: true,actions: []),
      body: Obx(() => Stack(
        children: [
          trackAppController.applications.isEmpty?
          trackAppController.isLoading.value?
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
              itemCount: trackAppController.applications.length,
              itemBuilder: (context, index) {
                TrackAppData application = trackAppController.applications[index];
                return ApplicationTile(
                  name: application.country!,
                  description: application.details!,
                  status: application.status!,
                );
              },
            ),
          ),

          trackAppController.isLoading.value? Center(child: CircularProgressIndicator()):SizedBox()
        ],
      )),
    );
  }
}


class ApplicationTile extends StatelessWidget {
  final String name;
  final String description;
  final String status;

  const ApplicationTile({
    Key? key,
    required this.name,
    required this.description,
    required this.status,
  }) : super(key: key);

  Color getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.deepOrangeAccent;
      case "In Progress":
        return Helper.lightBlueColor;
      case "Completed":
        return Helper.darkBlueColor;
      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status) {
      case "Pending":
        return Icons.hourglass_top;
      case "In Progress":
        return Icons.loop;
      case "Completed":
        return Icons.check_circle;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Helper.whiteColor,
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(7),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Helper.blackColor,
                          fontSize: 16,
                        ),
                      ),

                      Container(
                        alignment:Alignment.topLeft,
                        width: Global.sWidth*0.7,
                        child: Html(
                          data: description,
                        ),
                      ),

                      /*Text(
                        description,
                        style: TextStyle(
                          color: Helper.darkBlueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),*/
                      Text(
                        status,
                        style: TextStyle(
                          color: getStatusColor(status),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          
                  Icon(
                    getStatusIcon(status),
                    color: getStatusColor(status),
                    size: 32,
                  )
                ],
              ),

              SizedBox(height: 10,),
              LinearProgressIndicator(
                value: status == "Pending"
                    ? 0.33
                    : status == "In Progress"
                    ? 0.66
                    : 1.0,
                color: getStatusColor(status),
                minHeight: 7,
                backgroundColor: Helper.greyColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}