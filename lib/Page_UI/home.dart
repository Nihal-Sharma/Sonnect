import 'package:flutter/material.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/eva.dart';

import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: Colors.black
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color.fromRGBO(46, 72, 86, 100),
          //       Color.fromRGBO(10, 15, 23, 100)
          //     ]),
          ),
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
            "Sonnect",
            style: TextStyle(fontFamily: 'itim', fontSize: 30),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Iconify(
                  Ic.sharp_search,
                  size: 35,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 5,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/homechat');
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              //***************************PROFILE 1. */
              createcontent(
                  "images/cudp.jpg",
                  "Chandigarh University",
                  "images/cupost.jpg",
                  "Everyone loves Chandigarh University\nwill you be our everyone ?",
                  "Posted 12 hours ago",
                  size),
              createcontent(
                  "images/ptudp.jpg",
                  "Punjab Technical University",
                  "images/ptupost.jpg",
                  "Our student have future,\nbigger than our buildings",
                  "Posted 3 hours ago",
                  size),
              createcontent(
                  'images/cgcdp.jpeg',
                  "CGC Landran",
                  "images/cgcpost.jpg",
                  "Our Students have future brighter,\nthan our paint on buildings",
                  "Posted a while ago",
                  size),
              createcontent(
                  'images/iitdp.jpeg',
                  "IIT Kharagpur",
                  "images/iitpost.jpg",
                  "No caption required\nour placement speakes",
                  "Posted 3 hours ago",
                  size),
              createcontent(
                  "images/iitroorkedp.jpeg",
                  "IIT Roorkee",
                  "images/iitroorokepost.jpg",
                  "********\nthese are our alumnis\nevery one is a star",
                  "Posted 1hour in future",
                  size)
            ],
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: const [ListTile()],
        )),
      ),
    );
  }

  createcontent(String dppath, String username, String postpath, String caption,
      String posttime, Size size) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: Color.fromRGBO(158, 158, 158, 0.468)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                      radius: 20, backgroundImage: AssetImage(dppath)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    username,
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'itim', fontSize: 17),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Image border
            child: SizedBox.fromSize(
              size: Size.fromHeight(size.width), // Image radius
              child: Image.asset(postpath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  caption,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'itim',
                      fontSize: 15),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Iconify(
                      Bx.upvote,
                      size: 28,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Iconify(
                      Bx.downvote,
                      size: 28,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Iconify(
                      Eva.bookmark_outline,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              posttime,
              style: const TextStyle(
                  color: Color.fromARGB(203, 255, 255, 255), fontSize: 9),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
