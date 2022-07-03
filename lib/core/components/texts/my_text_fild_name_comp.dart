import 'package:flutter/material.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';

class MyTextFildNameComp {
  static Text myTextFildName(text) {
    return Text(
      text,
      style: MyTextStyleComp.myTextStyle(
        color: MainColors.color696974,
        fontSize: 16,
        weight: FontWeight.w500,
      ),
    );
  }
}
