import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/view/screens/cart/view/cart_view.dart';
import 'package:organico/view/screens/explore/explore_view.dart';
import 'package:organico/view/screens/home/view/home_view.dart';
import 'package:organico/view/screens/profile/view/profile_view.dart';

class ScreensView extends StatefulWidget {
  const ScreensView({Key? key}) : super(key: key);

  @override
  State<ScreensView> createState() => _ScreensViewState();
}

class _ScreensViewState extends State<ScreensView>
    with TickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller!.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const HomeView(),
          const ExploreView(),
          const CartView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: TabBar(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        indicatorColor: Colors.transparent,
        tabs: [
          myTab(0, 'home_black', 'home_dark', 'Home'),
          myTab(1, 'search_black', 'search_dark', 'Search'),
          myTab(2, 'cart_black', 'cart_dark', 'Cart'),
          myTabProfile(3, 'profile_black', 'profile_dark', 'Profile'),
        ],
        onTap: (v) {
          setState(() {});
          controller!.index = v;
        },
      ),
    );
  }

  Tab myTabProfile(int index, String icon1, String icon2, String text) {
    return Tab(
      icon: controller!.index == index
          ? SvgPicture.asset('assets/icons/tabBar/tabBar_$icon1.svg')
          : SvgPicture.asset('assets/icons/tabBar/tabBar_$icon2.svg'),
      child: Text(
        text,
        style: MyTextStyleComp.myTextStyle(
          color: controller!.index == index
              ? MainColors.colorBlackk
              : MainColors.color696974,
        ),
      ),
    );
  }

  Tab myTab(int index, String icon1, String icon2, String text) {
    return Tab(
      icon: controller!.index == index
          ? SvgPicture.asset('assets/icons/tabBar/tabBar_$icon1.svg')
          : SvgPicture.asset('assets/icons/tabBar/tabBar_$icon2.svg'),
      child: Text(
        text,
        style: MyTextStyleComp.myTextStyle(
          color: controller!.index == index
              ? MainColors.colorBlackk
              : MainColors.color696974,
        ),
      ),
    );
  }
}
