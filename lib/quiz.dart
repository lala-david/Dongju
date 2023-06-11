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

class _QuizState extends State<Quiz> {
  bool _isButtonPressed = false;

  void changeButtonText() {
    setState(() {
      _isButtonPressed = !_isButtonPressed;
    });
  }

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
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.pinkAccent,
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
          height: 800.0,
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
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:1)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.question_mark,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 1",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:2)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 2",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:3)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 3",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:4)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 4",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:5)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 5",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:6)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 6",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:7)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 7",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:8)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 8",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:9)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 9",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 30, right: 30),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      changeButtonText();
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => SolvePage(num:10)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          //_isButtonPressed ? 'hello' : '문제 선택됨',
                          "문제 10",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffc1bffa),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
