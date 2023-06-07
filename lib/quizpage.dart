import 'package:flutter/material.dart';

class QuizMain extends StatelessWidget {
  const QuizMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.red, width: 3),
          ),
          child: Builder(
            builder: (context) {
              return Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.green, width: 2),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
