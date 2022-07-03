import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/models/api_model.dart';
import 'package:organico/service/organico_service.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.colorWhitee,
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent",
              style: MyTextStyleComp.textStyleBlack_18_700,
            ),
            _listTile("Onion"),
            _listTile("Watermelon"),
            _listTile("Blackurrant"),
            _listTile("Mushroom"),
            Text(
              "Popular",
              style: MyTextStyleComp.textStyleBlack_18_700,
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: ApiService.getData(),
              builder: ((context, AsyncSnapshot<List<OrganicoApiModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("No Network"),
                  );
                } else {
                  var data = snapshot.data;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.525,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 0.78,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 25,
                      ),
                      itemCount: data!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MainColors.color(
                              data[index].name!.type.toString(),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 100,
                                  child: Image.asset(
                                    "assets/images/${data[index].category}/${data[index].name!.img}.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  data[index].name!.type.toString(),
                                  style: MyTextStyleComp.textStyleBlack_16_600,
                                ),
                                Text(
                                  data[index].category.toString(),
                                  style: MyTextStyleComp.textStyleDark_14_400,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data[index].name!.price.toString(),
                                      style:
                                          MyTextStyleComp.textStyleBlack_16_600,
                                    ),
                                    InkWell(
                                      child: SvgPicture.asset(
                                        "assets/icons/plus.svg",
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _listTile(String text) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset("assets/icons/search.svg"),
      title: Text(
        text,
        style: MyTextStyleComp.myTextStyle(
          color: MainColors.color92929D,
          fontSize: 16,
          weight: FontWeight.w400,
        ),
      ),
      trailing: SvgPicture.asset("assets/icons/search_view_X.svg"),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: MainColors.colorBlackk),
      elevation: 0,
      backgroundColor: MainColors.colorWhitee,
      title: Container(
        padding: const EdgeInsets.only(left: 12),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MainColors.colorF1F1F5,
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: MainColors.color92929D),
            const SizedBox(width: 12),
            Text(
              "Search anything here",
              style: MyTextStyleComp.myTextStyle(
                color: MainColors.color92929D,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
