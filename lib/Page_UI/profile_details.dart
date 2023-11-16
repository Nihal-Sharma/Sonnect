import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sonnect/Page_UI/utils/image_pick.dart';
import 'package:sonnect/fire_base/firebase_features.dart';
import 'dart:io';
import 'dart:async';

import 'package:sonnect/fire_base/image_upload.dart';

String name = "";
String email = "";
late Uint8List retimage;
String bioriyal = "";

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  Uint8List? _image;
  void selectImage() async {
    print("DONEEEEEEEEE");
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
      retimage = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    StoreData _upload = StoreData();
    FirebaseDataServie addall = FirebaseDataServie();

    TextEditingController biocontroller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    final Map<String, Object> pastdetails =
        ((ModalRoute.of(context) as dynamic).settings.arguments);
    name = pastdetails["Name"].toString();
    email = pastdetails["gmail"].toString();
    String bio;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: 'itim', fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //***************** BLACK AND DP PART AND EDIT PIC BUTTON */
            Container(
              height: size.height * 0.35,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          height: size.height * 0.23,
                          width: size.width)),
                  Positioned(
                      top: size.height * 0.15,
                      left: 145,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.black,
                        child: _image != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage("images/defaultpicjpg.jpg")),
                      )),
                  Positioned(
                      left: size.width * 0.38,
                      bottom: 0,
                      child: TextButton(
                        onPressed: selectImage,
                        child: const Text(
                          "Add Profile Pic",
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                  Positioned(
                      top: size.height * 0.06,
                      left: size.width * 0.3,
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                        ),
                      )),
                ],
              ),
            ),
            //******************SECOND ABOUT SECTION */
            Container(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: biocontroller,
                maxLines: 5, //or null
                decoration: InputDecoration(
                  hintText: 'Tell us about yourself',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(184, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(200, 0, 0, 0), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )),
            //**************** THIRD PART STUDENT AND SIGN UP BUTTON*/
            Container(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Whats your Proffession ? ",
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Container(
                            height: 90,
                            width: 110,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(217, 213, 213, 100),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)),
                            child: Center(
                              child: Text("Student"),
                            )),
                      ),
                      const SizedBox(
                        width: 19.5,
                      ),
                      InkWell(
                        child: Container(
                          height: 90,
                          width: 110,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 213, 213, 100),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1)),
                          child: Center(
                            child: Text("Proffessor"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.5,
                      ),
                      InkWell(
                        child: Container(
                          height: 90,
                          width: 110,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(217, 213, 213, 100),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1)),
                          child: Center(
                            child: Text("University"),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      bio = biocontroller.text;
                      setState(() {
                        bioriyal = bio;
                      });
                      // ignore: unnecessary_null_comparison
                      if (bio != null) {
                        addall.addbio("users", email, bio, "Teacher");
                      }
                      if (_image != null) {
                        String url =
                            _upload.uploadImage(email, _image!).toString();
                        print(url);
                        addall.addpic('users', email, url);
                      }
                      Navigator.pushNamed(
                        context,
                        '/homepage',
                      );
                    },
                    child: Container(
                      // padding: EdgeInsets.only(left: 60),
                      height: 65,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 213, 213, 100),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)),
                      child: Center(
                          child: Text("Sign up ",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'itim',
                                  fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),

        // child: Stack(
        //   children: [
        //     Positioned(
        //         top: 0,
        //         child: Container(
        //             decoration: const BoxDecoration(
        //               color: Colors.black,
        //             ),
        //             height: size.height * 0.23,
        //             width: size.width)),
        // Positioned(
        //   top: size.height * 0.15,
        //   left: 150,
        //   child: const CircleAvatar(
        //     radius: 65,
        //     backgroundColor: Colors.black,
        //     child: CircleAvatar(
        //       radius: 60,
        //       backgroundColor: Color.fromARGB(255, 129, 126, 126),
        //     ),
        //   ),
        // ),
        // Positioned(
        //     top: size.height * 0.06,
        //     left: size.width * 0.3,
        //     child: const Text(
        //       "Name of Owner",
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 23,
        //       ),
        //     )),
        //     Positioned(
        //         top: size.height * 0.3,
        //         left: size.width * 0.38,
        // child: TextButton(
        //   onPressed: () {},
        //   child: const Text(
        //     "Add Profile Pic",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // )),
        //     Positioned(
        //         top: size.height * 0.5,
        //         child: Container(
        //           width: size.width * 0.5,
        //           child: TextFormField(
        //             maxLines: null,
        //             keyboardType: TextInputType.multiline,
        //           ),
        //         ))
        //   ],
        // ),
      ),
    );
  }
}

class ggmail {
  test() {
    print(email);
    return email;
  }
}

class gname {
  test() {
    print(name);
    return name;
  }

  imageret() {
    return retimage;
  }
  retbio(){
    return bioriyal;
  }
}
