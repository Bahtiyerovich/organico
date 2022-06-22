import 'package:flutter/material.dart';
import 'package:organico/core/base/base_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/view/splash/cubit/splash_cubit.dart';
import 'package:organico/view/splash/state/splash_state.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: SplashView,
        onPageBuilder: (context, widget) {
          return BlocProvider(
            create: (context) => SplashCubit(context),
            child: Scaffold(
              body: BlocConsumer<SplashCubit, SplashState>(
                listener: (context, state) {},
                builder: (context, state) => Center(
                  child: Image.asset('assets/images/Logo.png'),
                ),
              ),
            ),
          );
        });
  }
}
