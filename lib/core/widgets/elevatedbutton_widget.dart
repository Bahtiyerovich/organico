import 'package:flutter/material.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';

class RedButton extends StatefulWidget {
  String text;
  VoidCallback onpressed;

  RedButton({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);

  @override
  State<RedButton> createState() => _RedButtonState();
}

class _RedButtonState extends State<RedButton> {
  int temp = 0;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: _RedButton(),
    );
  }

  OutlinedButton _RedButton() {
    return OutlinedButton(
      onPressed: widget.onpressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: MainColors.darkPink,
        fixedSize: const Size(350, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        primary: color = MainColors.darkPink,
      ),
      child: FittedBox(
        child: OrgText(
          text: widget.text,
          size: FontsConst.kMediumFont16,
          color: MainColors.white,
          fontWeight: WeightsConst.kLargeWeight800,
        ),
      ),
    );
  }
}
