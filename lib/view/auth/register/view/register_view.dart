import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/core/components/my_app_bar_auth_comp.dart';
import 'package:organico/core/components/my_text_style_comp.dart';
import 'package:organico/core/components/password_text_find_comp.dart';
import 'package:organico/core/components/texts/my_text_fild_comp.dart';
import 'package:organico/core/components/texts/my_text_fild_name_comp.dart';
import 'package:organico/core/components/texts/text_check_box_comp.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/core/widgets/next_button_page_comp.dart';
import 'package:organico/view/auth/register/cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final TextEditingController controlName = TextEditingController();
  final TextEditingController controlPhoneCode = TextEditingController();
  final TextEditingController controlPhoneNum = TextEditingController();
  final TextEditingController controlPass = TextEditingController();
  final TextEditingController controlPassConfirm = TextEditingController();
  final bool chackBox = false;
  final bool pass = true;
  final bool passConfirim = true;
  final String text =
      'It looks like you don’t have an account on this number. Please let us know some information for a secure service.';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: MyAppBarAuthComp.myAppBarAuth(context, 'New Registration'),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            bool sec1 = context.watch<RegisterCubit>().sec1;
            bool sec2 = context.watch<RegisterCubit>().sec2;
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.89,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Text
                      Text(
                        text,
                        style: MyTextStyleComp.myTextStyle(
                          fontSize: 16,
                          color: MainColors.color92929D,
                          weight: FontWeight.w400,
                        ),
                      ),
                      //FULL Name
                      MyTextFildNameComp.myTextFildName('Full Name'),
                      MyTextFildComp.myTextFild(controlName),
                      MyTextFildNameComp.myTextFildName('Password'),
                      PassTextFildComp.passTextFild(
                        context,
                        'Password',
                        controlPass,
                        sec1,
                        context.read<RegisterCubit>().secPass1,
                      ),
                      //Password Confirmation
                      MyTextFildNameComp.myTextFildName(
                          'Password Confirmation'),
                      PassTextFildComp.passTextFild(
                        context,
                        'Password Confirmation',
                        controlPassConfirm,
                        sec2,
                        context.read<RegisterCubit>().secPass2,
                      ),
                      //ChackBox
                      Row(
                        children: [
                          Checkbox(
                            value: context.watch<RegisterCubit>().textCheckBox,
                            onChanged: (v) {
                              context.read<RegisterCubit>().etidChackBox(v!);
                            },
                          ),
                          TextCheckBoxComp.textCheckBox(
                              'I accept the ', MainColors.colorBlackk),
                          TextCheckBoxComp.textCheckBox(
                              'Terms of Use ', MainColors.color2ECC71),
                          TextCheckBoxComp.textCheckBox(
                              'and ', MainColors.colorBlackk),
                          TextCheckBoxComp.textCheckBox(
                              'Privacy Policy', MainColors.color2ECC71),
                        ],
                      ),
                      //Sign Up
                      NextButtonPageComp.nextButtonPage(
                          context, 'Sign Up', 'screens'),
                      //or use
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'or use',
                          style: MyTextStyleComp.myTextStyle(
                            color: MainColors.color92929D,
                            fontSize: 16,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      //Sign Up whit Google
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: MainColors.colorWhitee,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width,
                            52,
                          ),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(
                              color: MainColors.color92929D,
                            ),
                          ),
                        ),
                        child: Text(
                          'Sign Up with Google',
                          style: MyTextStyleComp.myTextStyle(
                            color: MainColors.colorBlackk,
                            weight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
