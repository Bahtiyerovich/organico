import 'package:flutter/material.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/extensions/context_extensions.dart';
import 'package:organico/core/widgets/appbar_widget.dart';
import 'package:organico/core/widgets/listTile_widget.dart';
import 'package:organico/core/widgets/red_button.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: PaymentMethodPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
            appBar: OrgAppBar(title: title!),
            body: SizedBox(
              height: context.h * 0.84,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: context.h * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: MainColors.darkGrey),
                      // color: Colors.red
                    ),
                    child: ListTileWidget(
                        icon: 'assets/icons/cards/creditCard.svg',
                        title: 'Credit Card',
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_payment_method');
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: context.h * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: MainColors.darkGrey),
                      // color: Colors.red
                    ),
                    child: ListTileWidget(
                        icon: 'assets/icons/paypal.svg',
                        title: 'PayPal',
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_payment_method');
                        }),
                  ),
                  Spacer(),
                  RedButton(
                      text: 'Add payment',
                      onpressed: () {
                        Navigator.pushNamed(context, '/add_payment_method');
                      }),
                ],
              ),
            ),
          );
        });
  }
}
