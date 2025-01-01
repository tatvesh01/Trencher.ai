import 'package:eductrl/Utils/helper.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const CommonAppBar({
    required this.title,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color: Helper.whiteColor,fontWeight: FontWeight.w500,fontSize: 20),),
      centerTitle: true,
      backgroundColor: Helper.darkBlueColor,
      leading: showBackButton
          ? IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded,color: Helper.whiteColor,),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
