import 'package:flutter/material.dart';
import 'package:plz/testauth.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Builder(
        builder: (context){
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Container(
              //color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 30)),
                    SizedBox(height: 60,),
                    Center(
                      child: Text(
                        "어서오세요!",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Container(
                      width: 250,
                      height: 250,
                      child: Center(child: Image.asset('assets/grape.png'),),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xffc1bffa), Color(0xffc2afc6)], ),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Container(
                      child: ElevatedButton(onPressed:() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context)=>AuthGate()));
                      }, child: Container(
                        padding: EdgeInsets.all(15),
                        child: const Text(
                          '시작하기',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff8887ea),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0,),
                    // ElevatedButton(onPressed:() {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (BuildContext context)=>AuthGate()));
                    // }, child: const Text('회원가입',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Color(0xffc1bffa),
                    //     padding: EdgeInsets.symmetric(horizontal: 100, vertical: 17),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
