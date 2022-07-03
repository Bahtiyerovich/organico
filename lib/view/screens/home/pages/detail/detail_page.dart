
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/models/api_model.dart';
import 'package:organico/service/get_storage_service.dart';
import 'package:organico/view/screens/home/pages/detail/detail_cubit.dart';
import 'package:organico/view/screens/home/pages/detail/detail_state.dart';

class DetailPage extends StatelessWidget {
  final OrganicoApiModel getData;
  final int index;

  const DetailPage({Key? key, required this.getData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit(),
      child: Scaffold(
        backgroundColor: MainColors.colorWhitee,
        appBar: _appBar(context),
        body: BlocConsumer<DetailCubit, DetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/images/${getData.category}/${getData.name!.img}.png",
                            height: 210,
                            width: 238,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          getData.name!.type.toString(),
                          style: MyTextStyleComp.textStyleBlack_25_600,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getData.category.toString(),
                              style: MyTextStyleComp.textStyleDark_14_400,
                            ),
                            SizedBox(
                              width: 130,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: SvgPicture.asset(
                                      "assets/icons/minus.svg",
                                    ),
                                    onTap: () {
                                      context.read<DetailCubit>().minus(1);
                                    },
                                  ),
                                  Text(
                                    context
                                        .watch<DetailCubit>()
                                        .count
                                        .toString(),
                                    style: MyTextStyleComp.myTextStyle(
                                      color: MainColors.colorBlackk,
                                      fontSize: 25,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  InkWell(
                                    child: SvgPicture.asset(
                                        "assets/icons/plus.svg"),
                                    onTap: () {
                                      context.read<DetailCubit>().plus(1);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          getData.name!.price.toString(),
                          style: MyTextStyleComp.textStyleBlack_25_600,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: MyTextStyleComp.textStyleBlack_18_700,
                        ),
                        Text(
                          getData.name!.detail.toString(),
                          style: MyTextStyleComp.textStyleDark_14_400,
                        ),
                        _listTile("detail_time", "Time Delivery", "25-30 Min"),
                        _listTile(
                          "deatail_category",
                          "Category",
                          getData.category.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //! red button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: MainColors.darkPink,
                                fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.72,
                                  52,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: const Text('Add to cart'),
                              onPressed: () {},
                            ),
                            SvgPicture.asset("assets/icons/detail_chat.svg"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  ListTile _listTile(String svg, String text, String text2) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset("assets/icons/$svg.svg"),
      title: Text(
        text,
        style: MyTextStyleComp.textStyleBlack_18_700,
      ),
      subtitle: Text(
        text2,
        style: MyTextStyleComp.textStyleDark_14_400,
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: MainColors.colorBlackk),
      elevation: 0,
      backgroundColor: MainColors.colorWhitee,
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/heart.svg"),
          onPressed: () async {
            await GetStorageService.box.write(
              "${getData.name!.type}",
              getData,
            );
            GetStorageService.count += 1;
            Navigator.pushNamed(context, '/my_wishlist', arguments: getData);
          },
        ),
      ],
    );
  }
}
