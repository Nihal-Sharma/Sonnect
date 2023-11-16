// import 'package:flutter/foundation.dart';
// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:sonnect/fire_base/firebase_features.dart';

// import 'package:flutter/widgets.dart';
String femail = "";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseDataServie _data = FirebaseDataServie();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Size size = MediaQuery.of(context).size;

    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: size.height * 0.5,
                    width: size.width,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Image.asset(
                              "images/upperrect.png",
                              fit: BoxFit.fill,
                            )),
                        Positioned(
                            top: 100,
                            bottom: 130,
                            left: 105,
                            child: Image.asset("images/mainlogo.png")),
                        const Positioned(
                            bottom: 17,
                            left: 30,
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontFamily: 'itim',
                                  fontSize: 28,
                                  color: Colors.white),
                            ))
                      ],
                    )),
                SizedBox(
                    height: size.height * 0.5,
                    child: Stack(children: [
                      Positioned(
                        top: 30,
                        left: 20,
                        right: 20,
                        child: textinputfield(
                            "E-mail", false, emailController, Icons.mail),
                      ),
                      Positioned(
                        top: 110,
                        left: 20,
                        right: 20,
                        child: textinputfield(
                            "Password", true, passwordController, Icons.lock),
                      ),
                      Positioned(
                          top: 155,
                          right: 20,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/forgotpass");
                              },
                              child: const Text(
                                "Forgot password ?",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "itim",
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ))),
                      Positioned(
                        top: 210,
                        right: 130,
                        left: 130,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                                elevation: 3,
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 24, fontFamily: "itim"),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 350,
                          left: 300,
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            "images/bottomflow.png",
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                          bottom: 27,
                          right: 40,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            icon: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 60,
                            ),
                          )),
                      const Positioned(
                          bottom: 10,
                          left: 130,
                          child: Row(
                            children: [
                              Text(
                                "Dont have an account ? ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 14),
                              ),
                            ],
                          )),
                    ])),
              ],
            ),
          ),
        ));
  }

  Widget textinputfield(String hinttxt, bool obs,
      TextEditingController controller, IconData micon) {
    return TextFormField(
      style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 20,
          fontFamily: 'itim'),
      controller: controller,
      obscureText: obs,
      decoration: InputDecoration(
        prefixIcon: Icon(
          micon,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        hintText: hinttxt,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: "itim",
            fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.612), width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  void login() async {
    String email = emailController.text;
    String password = passwordController.text;
    femail = email;
    _data.readData(email, "Name");
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user == null) {
      print("Error occured");
    } else {
      Navigator.popAndPushNamed(context, "/homepage");
    }
  }
}
