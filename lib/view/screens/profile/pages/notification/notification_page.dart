import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';
import 'package:organico/core/extensions/context_extensions.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> subtitle = [
    'Congratulations, your order has been sent. You can check here. \n28 Jun 2022 06:15 AM',
    '15% discount for all purchases above \$20. Check it now.\n28 Jun 2022 05:00 AM',
    'Let’s learn how to maximize the use of vouchers in the application.\n27 Jun 2022 02:00 PM',
  ];
  List<String> title = [
    'Order Status',
    'New Promo',
    'Tips',
  ];
  List<String> icons = [
    'assets/icons/notificationview/notification_orderStatus.svg',
    'assets/icons/notificationview/notifications_newPromo.svg',
    'assets/icons/notificationview/notification_Tips.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: NotificationPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: MainColors.transparent,
                  elevation: 0,
                  title: const Text('Notification'),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: context.w * 0.05),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/notification_settings');
                        },
                        child: SvgPicture.asset(
                            'assets/icons/notificationview/notifications_settings.svg'),
                      ),
                    )
                  ]),
              body: SizedBox(
                height: context.h * 0.6,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: SvgPicture.asset(icons[index]),
                          title: OrgText(
                            text: title[index],
                            size: FontsConst.kLargeFont20,
                            fontWeight: WeightsConst.kBoldWeight,
                            color: MainColors.black,
                          ),
                          subtitle: OrgText(
                            text: subtitle[index],
                            size: FontsConst.kExtraSmallFont8 + 4,
                            fontWeight: WeightsConst.kMediumWeight600,
                            color: MainColors.color92929D,
                          ),
                        ),
                      );
                    }),
              ));
        });
  }
}
