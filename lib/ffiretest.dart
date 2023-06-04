import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:plz/homepage.dart';

class TestFireUI extends StatelessWidget {
  const TestFireUI({Key? key}) : super(key: key);

  void signOut() async{ // 로그아웃 기능을 하는 메소드
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
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
          icon: Icon(Icons.home),
          onPressed: () {
            print('menu button is clicked!');
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                )
            );
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
          // SignOutButton(), -> 이것처럼 갖다 써도 되고, 만들어도 된다.
          //AppleSignInIconButton(),
        ],
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '추가 꾸미기 테스트',
              style: TextStyle(
                  color: Colors.green,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '정렬테스트',
              style: TextStyle(
                  color: Colors.green,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ],
    );
  }
}
