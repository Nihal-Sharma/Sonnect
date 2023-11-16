// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sonnect/fire_base/firebase_features.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseDataServie _data = FirebaseDataServie();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget whitespace() {
      return (SizedBox(
        height: size.height * 0.04,
      ));
    }

    return Form(
      key: formkey,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(81.0),
              child: AppBar(
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'login');
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                ),
                backgroundColor: Colors.transparent,
              )),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
                      "Create your account :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: "itim"),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30),
                  child: const Text(
                    "Please enter the following details",
                    style: TextStyle(
                        color: Colors.white, fontSize: 12, fontFamily: "itim"),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: textenter("FULL NAME", false, Icons.person,
                      nameController, "Please Enter name"),
                ),
                whitespace(),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: textenter("PHONE", false, Icons.phone, phoneNumber,
                      "Please enter phone number"),
                ),
                whitespace(),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: textenter("EMAIL", false, Icons.mail, emailController,
                      "Please Enter Email"),
                ),
                whitespace(),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: textenter("PASSWORD", true, Icons.lock,
                      passwordController, "Please enter password"),
                ),
                whitespace(),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: textenter("CONFIRM PASSWORD", true, Icons.lock,
                      confirmPassword, "Please confirm password"),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.35),
                  height: 45,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 40,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textenter(hinttxt, bool obtxt, IconData next,
      TextEditingController controller, String message) {
    return TextFormField(
        style: const TextStyle(color: Colors.white, fontFamily: 'itim'),
        validator: (v) {
          if (v!.isEmpty) {
            return message;
          }
          return null;
        },
        controller: controller,
        obscureText: obtxt,
        decoration: InputDecoration(
          prefixIcon: Icon(
            next,
            color: const Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
          hintText: hinttxt,
          hintStyle: const TextStyle(
              color: Colors.white, fontFamily: 'itim', fontSize: 16),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255), width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
        ));
  }

  void _signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confpassword = confirmPassword.text;
    String name = nameController.text;
    if (formkey.currentState!.validate()) {
      //validating current formstate
      if (password == confpassword) {
        dataAdd();
        User? user = await _auth.signUpWithEmailAndPassword(email, password);
        if (user == null) {
        } else {
          print("Successfully created");
          Navigator.pushNamed(context, "/profiledetails", arguments: {"Name" : name , "gmail" :email} );
        }
      } else {
        Fluttertoast.showToast(msg: "Password Doesnt match");
        passwordController.clear();
        emailController.clear();
        confirmPassword.clear();
      }
    }
  }

  void dataAdd() async {
    String email = emailController.text;
    String name = nameController.text;
    String collection = 'users';
    String phone = phoneNumber.text;
    _data.addData(collection, email, name, phone);
  }
}
