import 'package:flutter/material.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';

class ListTileAddressWidget extends StatelessWidget {
  ListTileAddressWidget({
    Key? key,
    this.subTitle,
    this.title,
    this.onPressed,
  }) : super(key: key);

  String? subTitle;
  String? title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: OrgText(
          text: title!,
          size: FontsConst.kMediumFont16,
          fontWeight: WeightsConst.kMediumWeight600,
          color: MainColors.colorBlackk,
        ),
        subtitle: OrgText(
          text: subTitle!,
          size: FontsConst.kSmallFont14,
          fontWeight: WeightsConst.kSmallWeight400,
          color: MainColors.colorBlackk,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
