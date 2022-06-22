// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:organico/view/screens/explore/explore_view.dart';
// import 'package:organico/view/screens/home/view/home_view.dart';
// import 'package:organico/view/screens/profile/view/profile_view.dart';


// class CartView extends StatefulWidget {
//   const CartView({Key? key}) : super(key: key);

//   @override
//   State<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends State<CartView> with TickerProviderStateMixin {
//   TabController? controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 4, vsync: this);
//     controller!.index = 2;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabBarView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: controller,
//         children: const [
//           HomeView(),
//           ExploreView(),
//           SettingsView(),
//           ProfileView(),
//         ],
//       ),
//       bottomNavigationBar: TabBar(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: controller,
//         indicatorColor: Colors.transparent,
//         tabs: [
//           myTab(0, 'tabBarContacts2', 'tabBarContacts1', 'Contacts'),
//           myTab(1, 'tabBarCalls2', 'tabBarCalls1', 'Calls'),
//           myTab(2, 'tabBarChats2', 'tabBarChats1', 'Chats'),
//           myTabProfile(3, 'tabBarContacts2', 'tabBarContacts1', 'Settings'),
//         ],
//         onTap: (v) {
//           print(controller!.index);
//           setState(() {});
//           controller!.index = v;
//         },
//       ),
//     );
//   }

//   Tab myTabProfile(int index, String icon1, String icon2, String text) {
//     return Tab(
//       icon: controller!.index == index
//           ? SvgPicture.asset('assets/icons/$icon1.svg')
//           : SvgPicture.asset('assets/icons/$icon2.svg'),
//       child: Text(
//         text.tr(),
//         style: TextStyle(
//           color: controller!.index == index
//               ? ColorsConst.color007AFF
//               : ColorsConst.color545458,
//         ),
//       ),
//     );
//   }

//   Tab myTab(int index, String icon1, String icon2, String text) {
//     return Tab(
//       icon: controller!.index == index
//           ? SvgPicture.asset('assets/icons/$icon1.svg')
//           : SvgPicture.asset('assets/icons/$icon2.svg'),
//       child: Text(
//         text.tr(),
//         style: TextStyle(
//           color: controller!.index == index
//               ? ColorsConst.color007AFF
//               : ColorsConst.color545458,
//         ),
//       ),
//     );
//   }
// }
