import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/constants/fonts_const.dart';
import 'package:organico/core/widgets/appbar_widget.dart';
import 'package:organico/view/screens/profile/pages/notification_settings/cubit/notification_settings_cubit.dart';
import 'package:organico/view/screens/profile/pages/notification_settings/state/notification_settings_state.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: NotificationSettingsPage,
        onPageBuilder: (context, widget) {
          return BlocProvider(
            create: (context) => NotificationSettingsCubit(),
            child: Scaffold(
              appBar: OrgAppBar(title: 'Notification Settings'),
              body: BlocConsumer<NotificationSettingsCubit,
                  NotificationSettingsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [
                      SwitchListTile.adaptive(
                          tileColor: MainColors.white,
                          title: OrgText(
                            text: 'In App Notification',
                            color: MainColors.textBlack,
                            size: FontsConst.kMediumFont16,
                            fontWeight: WeightsConst.kSmallWeight400,
                          ),
                          value: context
                              .watch<NotificationSettingsCubit>()
                              .notValue,
                          onChanged: (v) {
                            context
                                .read<NotificationSettingsCubit>()
                                .editValue1(v);
                          }),
                      SwitchListTile.adaptive(
                          tileColor: MainColors.white,
                          title: OrgText(
                            text: 'New Promo',
                            color: MainColors.textBlack,
                            size: FontsConst.kMediumFont16,
                            fontWeight: WeightsConst.kSmallWeight400,
                          ),
                          value: context
                              .watch<NotificationSettingsCubit>()
                              .promoValue,
                          onChanged: (v) {
                            context
                                .read<NotificationSettingsCubit>()
                                .editValue2(v);
                          }),
                      SwitchListTile.adaptive(
                          tileColor: MainColors.white,
                          title: OrgText(
                            text: 'Tips & trick',
                            color: MainColors.textBlack,
                            size: FontsConst.kMediumFont16,
                            fontWeight: WeightsConst.kSmallWeight400,
                          ),
                          value: context
                              .watch<NotificationSettingsCubit>()
                              .tipValue,
                          onChanged: (v) {
                            context
                                .read<NotificationSettingsCubit>()
                                .editValue3(v);
                          }),
                      SwitchListTile.adaptive(
                          tileColor: MainColors.white,
                          title: OrgText(
                            text: 'Update Application',
                            color: MainColors.textBlack,
                            size: FontsConst.kMediumFont16,
                            fontWeight: WeightsConst.kSmallWeight400,
                          ),
                          value: context
                              .watch<NotificationSettingsCubit>()
                              .upgradeValue,
                          onChanged: (v) {
                            context
                                .read<NotificationSettingsCubit>()
                                .editValue4(v);
                          }),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}