import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/models/api_model.dart';
import 'package:organico/service/get_storage_service.dart';

class MyWishlistPage extends StatelessWidget {
  const MyWishlistPage({Key? key, required this.getData}) : super(key: key);

  final OrganicoApiModel getData;

  @override
  Widget build(BuildContext context) {
    final OrganicoApiModel box = GetStorageService.box.read("${getData.name!.type}");
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.1,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          itemCount: GetStorageService.count,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: MainColors.color(getData.name!.type.toString()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 74,
                        width: 92,
                        child: Image.asset(
                          "assets/images/${box.category}/${box.name!.img}.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        box.name!.type.toString(),
                        style: MyTextStyleComp.textStyleBlack_16_600,
                      ),
                      Text(
                        "1 Kilogram",
                        style: MyTextStyleComp.textStyleDark_14_400,
                      ),
                    ],
                  ),
                  InkWell(
                    child: SvgPicture.asset("assets/icons/heart_red.svg"),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: MainColors.colorBlackk),
      elevation: 0,
      backgroundColor: MainColors.colorWhitee,
      title: Text(
        "My Wishlist",
        style: MyTextStyleComp.textStyleBlack_18_700,
      ),
    );
  }
}
