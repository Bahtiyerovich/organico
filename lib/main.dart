import 'routes/myroutes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 8080);
  await FirebaseStorage.instance.useStorageEmulator('localhost', 8080);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organico',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.instanse.onGenerate,
      initialRoute: '/profile',
    );
  }
}