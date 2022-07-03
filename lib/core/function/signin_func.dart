import 'package:flutter/material.dart';
import 'package:organico/core/constants/colors_const.dart';
import 'package:organico/view/auth/view/auth_view.dart';

class SignInFunc {
  static int passLimet = 6;
  static signInFunc(
    BuildContext context,
    TextEditingController phoneCode,
    TextEditingController phoneNumber,
    TextEditingController password,
    List data,
  ) async {
    for (int i = 0; i < data.length; i++) {
      if (phoneCode.text.isNotEmpty &&
          phoneNumber.text.isNotEmpty &&
          password.text.isNotEmpty) {
        if (data[i]['number'].toString() ==
            phoneCode.text.toString() + phoneNumber.text.toString()) {
          if (data[i]['password'].toString() == password.text.toString()) {
            MyMessenger.messenger(
              context,
              "Assalomu Aleykom Hush Kelibsiz",
              MainColors.color2ECC71,
            );

            Navigator.pushNamedAndRemoveUntil(
              context,
              '/screens',
              (route) => false,
              arguments: data,
            );
          } else {
            if (SignInFunc.passLimet == 1) {
              Navigator.pushNamed(context, '/forgot_password');
              passLimet = 6;
            } else if (SignInFunc.passLimet <= 3) {
              SignInFunc.passLimet -= 1;

              await MyMessenger.messenger(
                context,
                "Kechirasiz siz parolingizni noto'g'ri kiritdingiz iltmos qaytadan tekshirib kiring.  Sizda kiritish qolgan: ${SignInFunc.passLimet}",
                MainColors.darkPink,
              );
            } else {
              SignInFunc.passLimet -= 1;

              await MyMessenger.messenger(
                context,
                "Kechirasiz siz parolingizni noto'g'ri kiritdingiz iltmos qaytadan tekshirib kiring.",
                MainColors.darkPink,
              );
            }
          }
        } else {
          MyMessenger.messenger(
            context,
            "Unday Nomer ro'yxatda yo'q",
            MainColors.darkPink,
          );
        }
      } else if (phoneCode.text.isNotEmpty &&
          phoneNumber.text.isNotEmpty &&
          password.text.isEmpty) {
        MyMessenger.messenger(
          context,
          "Iltmos parolingizni kiriting",
          MainColors.darkPink,
        );
      } else if (phoneCode.text.isEmpty &&
          phoneNumber.text.isEmpty &&
          password.text.isNotEmpty) {
        MyMessenger.messenger(
          context,
          "Iltmos telefon nomeringizni kiriting",
          MainColors.darkPink,
        );
      } else {
        MyMessenger.messenger(
          context,
          "Iltmos telefon nomeringiz bilan parolingizni kiriting",
          MainColors.darkPink,
        );
      }
    }
  }
}