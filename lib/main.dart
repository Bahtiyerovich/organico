import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organico/routes/myroutes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}
// showCupertinoModalPopup(context: context, builder: builder)

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organico',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OrgRoutes.instanse.onGenerate,
      initialRoute: '/profile',
    );
  }
}
