// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';

class OrgAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  final Color? color;
  Color? textColor = MainColors.black;

  OrgAppBar({
    Key? key,
    required this.title,
    this.textColor,
    this.color,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 16.0,
          color: MainColors.black,
        ),
      ),
      leadingWidth: 70.0,
      centerTitle: false,
      backgroundColor: MainColors.transparent,
      elevation: 0,
      foregroundColor: MainColors.black,
      title: OrgText(
        text: title,
        size: FontsConst.kLargeFont20 - 2,
        fontWeight: WeightsConst.kMediumWeight600,
      ),
    );
  }
}
