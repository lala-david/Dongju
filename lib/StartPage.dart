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
      backgroundColor: Colors.amber,
      appBar : PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: const Color(0xffffffff),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
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
                    Center(
                      child: Text(
                        "Cluster",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(height: 60,),
                    Center(
                      child: Text(
                        "어서오세요!",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xffc1bffa), Color(0xffc2afc6)], ),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    ElevatedButton(onPressed:() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context)=>AuthGate()));
                    }, child: const Text(
                      '시작 하기',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8887ea),
                        padding: EdgeInsets.symmetric(horizontal: 105, vertical: 17),
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
