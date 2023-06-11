import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:plz/bottom.dart';
import 'package:plz/quiz.dart';
import 'package:plz/rankingtest.dart';

import 'Profilepage.dart';
import 'Quizpage.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: '힘내자',
//       home: Main(),
//     );
//   }
// } 단독 페이지 실행용

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    // final List<Widget> _children = [
    //   HomePage(),
    //   SearchPage(),
    //   FavoritesPage(),
    //   ProfilePage(),
    // ];

    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
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
          height: 800.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "우리들의 게임을 즐겨주세요.",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // SizedBox(height: 100,),
              Container(
                margin: EdgeInsets.only(top: 10, left: 30, right: 30,),
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // 아래로 그림자
                      )
                    ]),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Quiz(),
                        )
                    );
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //이미지대신 확인용 네모
                      Icon(Icons.quiz, size: 70,),
                      SizedBox(width: 30), // 이미지와 텍스트 사이의 간격
                      Text(
                        '문제',
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Color(0xffc9c7fa),
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(top: 15, left: 30, right: 30,),
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // 아래로 그림자
                      )
                    ]),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context)=>RankingSystemPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_events, size: 70,),
                      SizedBox(width: 30), // 이미지와 텍스트 사이의 간격
                      Text(
                        '랭킹',
                        style: TextStyle(
                            fontSize: 35
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Color(0xffb2b0fd),
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),

              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(top: 15, left: 30, right: 30,),
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // 아래로 그림자
                      )
                    ]),

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profilepage(),
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_box, size: 70,),
                      SizedBox(width: 30), // 이미지와 텍스트 사이의 간격
                      Text(
                        '내 정보',
                        style: TextStyle(
                            fontSize: 35
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Color(0xffe5e3ff),
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // Container(
              //   child: Text(
              //       'Copyright for Team_Cluster all rights reserved.'
              //   ),
              // )
            ],
          ),
        ),
      ),
      //endDrawer: Text('Copyright for \'고창의 왕자\' 유동주 all rights reserved.'),
      // bottomSheet: Container(
      //   child: Text(
      //       'Copyright for \'고창의 왕자\' 유동주 all rights reserved.'
      //   ),
      // ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            'Copyright for Team_Cluster all rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: onTabTapped,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Favorites',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
      //bottomNavigationBar: MenuBottom(),
    );
  }
}
