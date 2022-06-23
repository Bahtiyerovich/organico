import 'package:flutter/material.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';
import 'package:organico/core/widgets/appbar_widget.dart';

class NotificationSettingsPage extends StatefulWidget {
  NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _notValue = true;
  bool _promoValue = false;
  bool _tipValue = true;
  bool _upgradeValue = false;

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: NotificationSettingsPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
            appBar: OrgAppBar(title: 'Notification Settings'),
            body: Column(
              children: [
                SwitchListTile.adaptive(
                    tileColor: MainColors.white,
                    title: OrgText(
                      text: 'In App Notification',
                      color: MainColors.textBlack,
                      size: FontsConst.kMediumFont16,
                      fontWeight: WeightsConst.kSmallWeight400,
                    ),
                    value: _notValue,
                    onChanged: (status) {
                      setState(() {
                        _notValue = !_notValue;
                      });
                    }),
                SwitchListTile.adaptive(
                    tileColor: MainColors.white,
                    title: OrgText(
                      text: 'New Promo',
                      color: MainColors.textBlack,
                      size: FontsConst.kMediumFont16,
                      fontWeight: WeightsConst.kSmallWeight400,
                    ),
                    value: _promoValue,
                    onChanged: (status) {
                      setState(() {
                        _promoValue = !_promoValue;
                      });
                    }),
                SwitchListTile.adaptive(
                    tileColor: MainColors.white,
                    title: OrgText(
                      text: 'Tips & trick',
                      color: MainColors.textBlack,
                      size: FontsConst.kMediumFont16,
                      fontWeight: WeightsConst.kSmallWeight400,
                    ),
                    value: _tipValue,
                    onChanged: (status) {
                      setState(() {
                        _tipValue = !_tipValue;
                      });
                    }),
                SwitchListTile.adaptive(
                    tileColor: MainColors.white,
                    title: OrgText(
                      text: 'Update Application',
                      color: MainColors.textBlack,
                      size: FontsConst.kMediumFont16,
                      fontWeight: WeightsConst.kSmallWeight400,
                    ),
                    value: _upgradeValue,
                    onChanged: (status) {
                      setState(() {
                        _upgradeValue = !_upgradeValue;
                      });
                    }),
              ],
            ),
          );
        });
  }
}
