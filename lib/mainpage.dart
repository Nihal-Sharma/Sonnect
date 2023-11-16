import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:sonnect/Page_UI/community.dart';
import 'package:sonnect/Page_UI/complaints.dart';
import 'package:sonnect/Page_UI/home.dart';

import 'package:sonnect/Page_UI/profile_design.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final screens = const [
    HomePage(),
    ComplaintPage(),
    CommunityPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: screens[_index],
      bottomNavigationBar: GNav(
        // currentIndex : _index,
        backgroundColor: Colors.transparent,
        gap: 8,
        activeColor: Colors.white,
        tabs: const [
          GButton(
            icon: Icons.home,
            iconColor: Colors.white60,
            text: "Home",
          ),
          GButton(
            icon: Icons.assignment,
            iconColor: Colors.white60,
            text: "Complaints",
          ),
          GButton(
            icon: Icons.account_circle_outlined,
            iconColor: Colors.white60,
            text: "Community",
          ),
          GButton(
            icon: Icons.assignment_ind,
            iconColor: Colors.white60,
            text: "Profile",
            // iconActiveColor: Colors.black,
          ),
        ],
        selectedIndex: _index,
        onTabChange: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
