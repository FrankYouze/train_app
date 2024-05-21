import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:train_app/firebase_options.dart';
import 'package:train_app/pages/AuthController.dart';
import 'package:train_app/pages/map_page.dart';
// import 'package:train_app/pages/login_page.dart';
// import 'package:train_app/pages/map_page.dart';
// import 'package:train_app/pages/signup_page.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:AuthPage(),
    );
  }
}

