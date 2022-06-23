// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/view/screens/profile/pages/edit_profile/logincubit.dart';
import 'package:organico/view/screens/profile/pages/edit_profile/loginstate.dart';

class AuthView extends StatelessWidget {
  AuthView({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController(text: '+1');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
          
          body: SingleChildScrollView(
            child:
            
             BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                controller.text = context.watch<AuthCubit>().phoneCityCode;
                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton<String>(
                        value: context.watch<AuthCubit>().selectedLocation,
                        hint: Text(context.watch<AuthCubit>().selectedLocation),
                        onChanged: (v) =>
                            context.read<AuthCubit>().valueDrop(v!),
                        items:
                            <String>['USA', 'RUS', 'UZB'].map((String value) {
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
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: TextField(
                            controller: controller,
                            onChanged: (v) {
                              context.read<AuthCubit>().phoneCityCode = v;
                              context.read<AuthCubit>().codeCity(v);
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextFormField(),
                        ),
                      ],
                    ),
                    
                    
                  ],
                );
              },
            ),
          
          )),
    );
  }
}
