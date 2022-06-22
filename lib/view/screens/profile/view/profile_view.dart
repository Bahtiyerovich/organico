import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';
import 'package:organico/core/extensions/context_extensions.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  List<String> notif = [
    'Edit Profile',
    'My Orders',
    'My Wishlist',
    'My Address',
    'Payment Method',
    'Customer Service',
    'Change Password',
    'Logout'
  ];

  List<String> notifIcons = [
    'assets/icons/profile/profile_editProfile.svg',
    'assets/icons/profile/profile_myOrder.svg',
    'assets/icons/profile/profile_myWishlist.svg',
    'assets/icons/profile/profile_myAddress.svg',
    'assets/icons/profile/profile_payment.svg',
    'assets/icons/profile/profile_customer.svg',
    'assets/icons/profile/profile_changePassword.svg',
    'assets/icons/profile/profile_logOut.svg',
  ];

  List natifNavigations = [
    '/edit_profile',
    '/my_orders',
    '/',
    '/my_address',
    '/payment_method',
    '/customer_service',
    '/account_password',
    '/',

  ];

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: ProfileView,
        onPageBuilder: (context, widget) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MainColors.transparent,
              elevation: 0,
              title: OrgText(
                text: 'Profile',
                size: FontsConst.kLargeFont20,
                fontWeight: WeightsConst.kLargeWeight800,
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: context.w * 0.05),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/notification');
                    },
                    child: SvgPicture.asset(
                      'assets/icons/notificationview/notification.svg',
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.h * 0.02,
                        left: context.w * 0.3,
                        right: context.w * 0.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: context.h * 0.09,
                          child: Image.asset('assets/images/avatar.png'),
                        ),
                        SizedBox(
                          height: context.h * 0.01,
                        ),
                        OrgText(
                          text: 'Jane Doe',
                          color: MainColors.colorBlackk,
                          size: FontsConst.kMediumFont16 + 2,
                          fontWeight: WeightsConst.kLargeWeight800,
                        ),
                        OrgText(
                          text: '(307) 555-0133',
                          color: MainColors.color92929D,
                          size: FontsConst.kMediumFont16 + 2,
                          fontWeight: WeightsConst.kLargeWeight800,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.h * 0.6,
                    child: ListView.builder(
                        itemCount: notif.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, natifNavigations[index]);
                            },
                            child: ListTile(
                              leading: SvgPicture.asset(notifIcons[index]),
                              title: OrgText(
                                text: notif[index],
                                size: FontsConst.kMediumFont16,
                                fontWeight: WeightsConst.kMediumWeight600,
                                color: MainColors.colorBlackk,
                              ),
                              trailing: const Icon(Icons.chevron_right),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}
