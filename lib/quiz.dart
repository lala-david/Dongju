import 'package:flutter/material.dart';
import 'package:plz/Quizpage.dart';
import 'package:plz/bottom.dart';
import 'package:plz/StartPage.dart';
import 'package:plz/quizpage(not%20use).dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '힘내자',
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class Question extends StatelessWidget {
  final int number;
  const Question({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:number)),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.question_mark,
              color: Color(0xff8887ea),
              size: 35,
            ),
            SizedBox(width: 10),
            Text(
              //_isButtonPressed ? 'hello' : '문제 선택됨',
              "문제 $number",
              style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff8887ea), fontSize: 16,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Color(0xff8887ea)),
          ),
        ),
      ),
    );
  }
}

class _QuizState extends State<Quiz> {
  bool _isButtonPressed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.isCurrent == true) {
      // 현재 페이지가 다시 돌아왔을 때
      setState(() {
        _isButtonPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Question> question_list = [];
    for(int i = 1 ; i<11 ; i++){
      question_list.add(new Question(number: i));
    }
    return Scaffold(
      backgroundColor: Color(0xff8887ea),
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
      body: Container(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                    child: Text('문제를 선택해주세요~~', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: question_list,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: MenuBottom(),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go back to First Page'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
