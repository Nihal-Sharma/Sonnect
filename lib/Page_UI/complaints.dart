import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';

import 'package:iconify_flutter/icons/ph.dart';
import 'package:sonnect/Page_UI/comp1.dart';
import 'package:sonnect/Page_UI/comp2.dart';
import 'package:sonnect/Page_UI/comp3.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Scaffold(
          key: _key,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  icon: const Iconify(
                    Ph.graduation_cap_bold,
                    size: 35,
                    color: Colors.white,
                  )),
            ),
            centerTitle: true,
            title: const Text(
              "Complaints",
              style: TextStyle(fontFamily: 'itim', fontSize: 30),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/complaintchat');
                  },
                  icon: const Iconify(
                    Eva.message_circle_outline,
                    size: 35,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 10,
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: const TabBar(
              tabs: [
                Tab(text: "Public"),
                Tab(text: "Bounty"),
                Tab(text: "Tags"),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: const TabBarView(
            children: [Compf(), CompS(), CompT()],
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            children: const [ListTile()],
          )),
        ),
      ),
    );
  }
}
