import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:sonnect/fire_base/firebase_features.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Forgot Password",
            style: TextStyle(fontFamily: "itim", fontSize: 24),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "login");
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Lottie.asset("images/forgotpass.json",
                      fit: BoxFit.cover,
                      height: 250,
                      width: 250,
                      repeat: true,
                      reverse: true)),
              SizedBox(
                height: size.height * 0.05,
              ),
              const SizedBox(
                height: 120,
                width: 300,
                child: Text(
                  "We will send a password reset link on your mail",
                  style: TextStyle(
                      fontFamily: "itim", fontSize: 25, color: Colors.white),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child:
                      textenter("Email", false, Icons.mail, emailController)),
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                child: senbutton(size),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textenter(
    hinttxt,
    bool obtxt,
    IconData next,
    TextEditingController controller,
  ) {
    return TextFormField(
        style: const TextStyle(color: Colors.white, fontFamily: 'itim'),
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
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 255, 255), width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
        ));
  }

  Widget senbutton(Size hg) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
          onPressed: sendpass,
          style: ElevatedButton.styleFrom(
              elevation: 3,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: const Text(
            "Send Link",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'itim',
                fontSize: 23),
          )),
    );
  }

  void sendpass() async {
    String email = emailController.text;

    _auth.resetpass(email);
    Navigator.popAndPushNamed(context, "login");

    Fluttertoast.showToast(
      msg: "Email Sent",
      backgroundColor: Colors.white,
      textColor: Colors.black,
    );
  }
}
