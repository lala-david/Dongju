import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'testauth.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void signOut() async{ // 로그아웃 기능을 하는 메소드
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dong Ju',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('menu button is clicked!');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              print('logout button is clicked!');
              signOut(); // 로그아웃 함수
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sung1.jpg'),
                radius: 60.0,
              ),
            ),
            const Divider(
              height: 60.0, // 위 아래 요소와의 차이가 합 60이라는 말
              color: Colors.green,
              thickness: 1.0,
              endIndent: 30.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                  color: Colors.green,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              '유동주',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Coding Level',
              style: TextStyle(
                  color: Colors.green,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              '10',
              style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '소프트웨어학과 3학년',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '대 건진 아들',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}