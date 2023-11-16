import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';

import 'package:iconify_flutter/icons/ph.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Community",
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          shape: const CircleBorder(
              side: BorderSide(color: Colors.white, width: 2.0)),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: const [ListTile()],
        )),
      ),
    );
  }
}
