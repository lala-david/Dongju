import 'package:flutter/material.dart';
import 'package:plz/bottom.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '힘내자',
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

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
              )
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "유동주의 아메리칸 드림",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(top: 10, left: 30, right: 30,),
                height: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //이미지대신 확인용 네모
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                      ),
                      // Image.asset(
                      //   'assets/images/button_icon.png', // 이미지의 경로
                      //   width: 5, // 이미지의 너비
                      //   height: 5, // 이미지의 높이
                      // ),
                      SizedBox(width: 20), // 이미지와 텍스트 사이의 간격
                      Text(
                        '문젠',
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 30, right: 30,),
                height: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //이미지대신 확인용 네모
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                      ),
                      // Image.asset(
                      //   'assets/images/button_icon.png', // 이미지의 경로
                      //   width: 5, // 이미지의 너비
                      //   height: 5, // 이미지의 높이
                      // ),
                      SizedBox(width: 10), // 이미지와 텍스트 사이의 간격
                      Text(
                        '랭킹',
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 30, right: 30,),
                height: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context)=>LogIn()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //이미지대신 확인용 네모
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      // Image.asset(
                      //   'assets/images/button_icon.png', // 이미지의 경로
                      //   width: 5, // 이미지의 너비
                      //   height: 5, // 이미지의 높이
                      // ),
                      SizedBox(width: 10), // 이미지와 텍스트 사이의 간격
                      Text(
                        '마페',
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Text(
                    'Copyright for \'고창의 왕자\' 유동주 all rights reserved.'
                ),
              )
            ],
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
      bottomNavigationBar: MenuBottom(),
    );
  }
}
