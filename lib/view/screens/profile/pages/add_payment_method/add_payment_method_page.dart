import 'package:flutter/material.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';
import 'package:organico/core/extensions/context_extensions.dart';
import 'package:organico/core/widgets/appbar_widget.dart';
import 'package:organico/core/widgets/red_button.dart';

class AddPaymentMethodPage extends StatefulWidget {
  AddPaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethodPage> createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: AddPaymentMethodPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
            appBar: OrgAppBar(title: 'Add Payment Method'),
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrgText(
                    text: 'Select Method',
                    color: MainColors.textBlack,
                    size: FontsConst.kLargeFont20,
                    fontWeight: WeightsConst.kLargeWeight800,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: MainColors.black,
                          ),
                        ),
                        OrgText(
                          text: 'Credit Card',
                          color: MainColors.textBlack,
                          size: FontsConst.kMediumFont16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 15),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: MainColors.color92929D,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: MainColors.white,
                            ),
                          ),
                        ),
                        OrgText(
                          text: 'Paypal',
                          color: MainColors.textBlack,
                          size: FontsConst.kMediumFont16,
                        ),
                      ],
                    ),
                  ),
                  OrgText(
                    text: 'Details Method',
                    color: MainColors.textBlack,
                    size: FontsConst.kLargeFont20,
                    fontWeight: WeightsConst.kLargeWeight800,
                  ),
                  SizedBox(height: context.h * 0.02),
                  OrgText(
                    text: 'Name',
                    color: MainColors.color696974,
                    size: FontsConst.kMediumFont16,
                    fontWeight: WeightsConst.kLargeWeight800,
                  ),
                  SizedBox(height: context.h * 0.015),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                  ),
                  SizedBox(height: context.h * 0.02),
                  OrgText(
                    text: 'Credit Card Number',
                    color: MainColors.color696974,
                    size: FontsConst.kMediumFont16,
                    fontWeight: WeightsConst.kLargeWeight800,
                  ),
                  SizedBox(height: context.h * 0.015),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Credit Card Number',
                      hintStyle: TextStyle(
                        color: MainColors.color92929D,
                        fontSize: FontsConst.kMediumFont16,
                        fontWeight: WeightsConst.kMediumWeight600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                  ),
                  SizedBox(height: context.h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.w * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrgText(
                              text: 'CVV',
                              color: MainColors.color696974,
                              size: FontsConst.kMediumFont16,
                              fontWeight: WeightsConst.kLargeWeight800,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'CVV',
                                hintStyle: TextStyle(
                                  color: MainColors.color92929D,
                                  fontSize: FontsConst.kMediumFont16,
                                  fontWeight: WeightsConst.kMediumWeight600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: context.w * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrgText(
                              text: 'Expires',
                              color: MainColors.color696974,
                              size: FontsConst.kMediumFont16,
                              fontWeight: WeightsConst.kLargeWeight800,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Expires',
                                hintStyle: TextStyle(
                                  color: MainColors.color92929D,
                                  fontSize: FontsConst.kMediumFont16,
                                  fontWeight: WeightsConst.kMediumWeight600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(29),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  RedButton(text: 'Save', onpressed: () {}),
                ],
              ),
            ),
          );
        });
  }
}
