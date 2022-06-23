import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/base/base_view.dart';
// import 'package:organico/core/components/orgtext_comp.dart';
import 'package:organico/core/extensions/context_extensions.dart';
import 'package:organico/core/widgets/appbar_widget.dart';
import 'package:organico/core/widgets/red_button.dart';
import 'package:organico/view/screens/profile/pages/edit_profile/logincubit.dart';
import 'package:organico/view/screens/profile/pages/edit_profile/loginstate.dart';

class EditProfilePage extends StatelessWidget {
  final String? title;
  final String? avatar;

  EditProfilePage({Key? key, this.title, this.avatar}) : super(key: key);
  TextEditingController controller = TextEditingController(text: '+1');

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: EditProfilePage,
        onPageBuilder: (context, widget) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: Scaffold(
              appBar: OrgAppBar(
                title: title!,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: context.h * 0.04,
                                bottom: context.h * 0.03),
                            child: CircleAvatar(
                              radius: context.h * 0.09,
                              child: Image.asset(avatar!),
                            ),
                          ),
                          Positioned(
                            top: context.h * 0.17,
                            right: context.w * 0.001,
                            child: SvgPicture.asset(
                                'assets/icons/profile/editProfile_camera.svg'),
                          ),
                        ],
                      ),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        controller.text =
                            context.watch<AuthCubit>().phoneCityCode;
                        return Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButton<String>(
                                value:
                                    context.watch<AuthCubit>().selectedLocation,
                                hint: Text(context
                                    .watch<AuthCubit>()
                                    .selectedLocation),
                                onChanged: (v) =>
                                    context.read<AuthCubit>().valueDrop(v!),
                                items: <String>['USA', 'RUS', 'UZB']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    controller: controller,
                                    onChanged: (v) {
                                      context.read<AuthCubit>().phoneCityCode =
                                          v;
                                      context.read<AuthCubit>().codeCity(v);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: TextFormField(),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    RedButton(text: 'Save', onpressed: () {}),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
