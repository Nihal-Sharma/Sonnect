import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:sonnect/Page_UI/compchat.dart';
import 'package:sonnect/Page_UI/forgotpass_design.dart';
import 'package:sonnect/Page_UI/homechat.dart';
import 'package:sonnect/Page_UI/login_design.dart';
import 'package:sonnect/Page_UI/profile_details.dart';
import 'package:sonnect/mainpage.dart';
import 'Page_UI/signup_design.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const LoginPage(),
      '/signup': (context) => const SignUpPage(),
      '/homepage': (context) => const MainPage(),
      '/forgotpass': (context) => const ForgotPassword(),
      '/complaintchat': (context) => const CompChat(),
      '/homechat': (context) => const HomeChat(),
      '/profiledetails': (context) => const ProfileDetails()
    },
  ));
}
