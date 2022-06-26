import 'package:flutter/material.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';
import 'package:organico/core/extensions/context_extensions.dart';
import 'package:organico/core/widgets/appbar_widget.dart';
import 'package:organico/core/widgets/red_button.dart';

class ChangeNumberPage extends StatelessWidget {
  ChangeNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: ChangeNumberPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
            appBar: OrgAppBar(title: 'OTAC Number'),
            body: Padding(
              padding: EdgeInsets.all(context.w * 0.05),
              child: Column(
                children: [
                  OrgText(
                    text:
                        'It looks like you changed your phone number. Please enter the OTAC number that we have sent to your new phone number.',
                    fontWeight: WeightsConst.kSmallWeight400,
                    size: FontsConst.kMediumFont16,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: context.w * 0.05,
                      bottom: context.w * 0.05,
                    ),
                    padding: EdgeInsets.only(left: context.w * 0.05),
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(width: 1.5, color: MainColors.darkGrey),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: '6 Digit Code',
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: context.w*0.65,
                    bottom: context.h*0.02
                    ),
                    child: OrgText(
                      text: 'Resend Code',
                      color: MainColors.color2ECC71,
                      fontWeight: WeightsConst.kLargeWeight800,
                      size: FontsConst.kMediumFont16,
                    ),
                  ),
                  RedButton(text: 'Confirm', onpressed: () {})
                ],
              ),
            ),
          );
        });
  }
}
