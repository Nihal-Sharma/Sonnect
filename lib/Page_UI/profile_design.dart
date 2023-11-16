import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'profile_details.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  ggmail details = ggmail();
  gname _gname = gname();

  @override
  Widget build(BuildContext context) {
    // String url =
    //     storage.ref().child(details.test().getDownloadURL()).toString();
    String email = details.test();
    String name = _gname.test();
    Uint8List pic = _gname.imageret();
    String biotxt = _gname.retbio();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          //Outer Coloum
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // PROFILE DETAILS ************************************
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FOLLOWERS *****************************************
                  const Column(
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                            color: Color.fromARGB(148, 255, 255, 255)),
                      )
                    ],
                  ),
                  // PROFILE PIC ****************************************
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                          radius: 48, backgroundImage: MemoryImage(pic)),
                    ),
                  ),
                  // FOLLOWING DETAILS ***************************************
                  const Column(
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            color: Color.fromARGB(148, 255, 255, 255)),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // NAME *******************************
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'itim',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    "  |  ",
                    style: TextStyle(
                        color: Color.fromARGB(187, 255, 255, 255),
                        fontFamily: 'itim',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    "Student",
                    style: TextStyle(
                        color: Color.fromARGB(148, 255, 255, 255),
                        fontFamily: 'itim',
                        fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                biotxt,
                style: const TextStyle(
                    color: Color.fromARGB(148, 255, 255, 255), fontSize: 18),
              ),
              const SizedBox(
                height: 24,
              ),
              // ROW FOR BUTTONS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text("Contact"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/profiledetails",
                              arguments: {"Name": name, "gmail": email});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 98, 97, 97),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text("Edit Profile"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //TAB BAR *********************************************
              const TabBar(
                tabs: [
                  Tab(
                    text: "Posts",
                  ),
                  Tab(
                    text: "Communities",
                  ),
                  Tab(
                    text: "Complaints",
                  ),
                ],
                indicatorColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
