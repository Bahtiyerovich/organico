import 'package:flutter/material.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';

class OrderStatusDetailsPage extends StatelessWidget {
  const OrderStatusDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.colorWhitee,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MainColors.colorWhitee,
        title: Text(
          "Order Status Details",
          style: MyTextStyleComp.myTextStyle(
            fontSize: 18,
            weight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
