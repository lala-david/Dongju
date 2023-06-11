import 'package:flutter/material.dart';
import 'package:plz/quizpage(not use).dart';
import 'package:plz/testauth.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AuthGate(),
            )
        );
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '터치하면 넘어감 ㅋㅋ',
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
          ),
        ),
      ),
    );
  }
}
