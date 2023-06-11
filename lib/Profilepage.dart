import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff8887ea),
        title: Text(
          "Cluster",
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
