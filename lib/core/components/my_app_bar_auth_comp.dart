import 'package:flutter/material.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';

class MyAppBarAuthComp {
  static AppBar myAppBarAuth(BuildContext context, titleText) {
    return AppBar(
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: MainColors.colorBlackk,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: MainColors.transparent,
      title: Text(
        titleText,
        style: MyTextStyleComp.myTextStyle(
          fontSize: 18,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
