import 'package:flutter/material.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/extensions/context_extensions.dart';
import 'package:organico/core/widgets/appbar_widget.dart';
import 'package:organico/core/widgets/listTileAddress_widget.dart';
import 'package:organico/core/widgets/red_button.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: MyAddressPage,
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
                    child: ListTileAddressWidget(
                        title: 'Home',
                        subTitle: '3517 W. Gray St. Utica, Pennsylvania 57867',
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
                    child: ListTileAddressWidget(
                        title: 'Work',
                        subTitle: '2715 Ash Dr. San Jose, South Dakota 83475',
                        onPressed: () {
                          Navigator.pushNamed(context, '/add_payment_method');
                        }),
                  ),
                  Spacer(),
                  RedButton(
                      text: 'Add address',
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
