import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.colorWhitee,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _container(context, "myCupon_white", "15% Discount all item",
                "7 days remaining", MainColors.colorAA0023_15),
            const SizedBox(height: 20),
            _container(context, "myCupon_white", "Free Shipping",
                "7 days remaining", MainColors.colorAA0023_15),
            const SizedBox(height: 20),
            _container(context, "myCupon_white", "10% Discount all item",
                "7 days remaining", MainColors.colorAA0023_15),
            const SizedBox(height: 20),
            _container(context, "myCupon_dark", "Free Shipping",
                "0 days remaining", MainColors.color92929D_5)
          ],
        ),
      ),
    );
  }

  Container _container(
    BuildContext context,
    String svg,
    String text,
    String text2,
    Color color,
  ) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: ListTile(
        leading: SvgPicture.asset("assets/icons/cards/$svg.svg"),
        title: Text(
          text,
          style: MyTextStyleComp.textStyleBlack_16_600,
        ),
        subtitle: Text(
          text2,
          style: MyTextStyleComp.textStyleDark_14_400,
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: MainColors.colorBlackk),
      elevation: 0,
      backgroundColor: MainColors.colorWhitee,
      title: Text(
        "Your Cupon",
        style: MyTextStyleComp.textStyleBlack_18_700,
      ),
    );
  }
}
