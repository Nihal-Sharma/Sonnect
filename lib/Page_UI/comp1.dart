import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:iconify_flutter/icons/zmdi.dart';

class Compf extends StatefulWidget {
  const Compf({super.key});

  @override
  State<Compf> createState() => _CompfState();
}

class _CompfState extends State<Compf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            contentmaker("Against:  Chandigarh University",
                "This uni have a very Bad managment system\nno doubt they good infrastructure but\na teachers have bad mentality"),
            contentmaker("Against:  LPU",
                "There Startup fund commitee\nis a myth they dont even gave a penny\neven our startup came 3rd in hackathon"),
            contentmaker("Against:  CGC",
                "Thic university have a very bad attendance system\na singal holiday and they call yourparents"),
            contentmaker("Against:  IIT KGP(Proff.Deepak)",
                "I was just sitting and listening to this proffessor\nand suddenly he started shouting \nover me and broke my phone "),
            contentmaker("Against:  --", "--"),
            contentmaker("Against:  --", "--"),
            contentmaker("Against:  --", "--")
          ],
        ),
      ),
    );
  }

  contentmaker(String against, String description) {
    return Card(
      margin: EdgeInsets.only(left: 25, top: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(100, 60),
              topLeft: Radius.elliptical(100, 60),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      // shadowColor: Colors.grey,
      color: const Color.fromARGB(94, 255, 255, 255),
      elevation: 50,
      child: SizedBox(
        width: 360,
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text(
                    against,
                    style: const TextStyle(
                        fontFamily: 'itim',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
              SizedBox(
                height: 120,
                child: Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Color.fromARGB(255, 49, 49, 49), fontSize: 12),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Complained 2 hours ago",
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Iconify(
                          Bx.upvote,
                          size: 26,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Iconify(
                          Fa.comments_o,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Iconify(
                          Fa.book,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
