import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class CompChat extends StatefulWidget {
  const CompChat({super.key});

  @override
  State<CompChat> createState() => _CompChatState();
}

class _CompChatState extends State<CompChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Chats"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Iconify(
                  Ic.sharp_search,
                  size: 30,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
