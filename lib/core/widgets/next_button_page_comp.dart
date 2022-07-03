import 'package:flutter/material.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';

class NextButtonPageComp {
  static ElevatedButton nextButtonPage(BuildContext context, name, nextPage) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: MainColors.darkPink,
        fixedSize: Size(MediaQuery.of(context).size.width, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Text(
        '$name',
        style: MyTextStyleComp.myTextStyle(
          color: MainColors.colorWhitee,
          weight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/$nextPage');
      },
    );
  }
}
