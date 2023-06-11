import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '힘내자',
      home: Loading(),
    );
  }
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.white30,
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      body: Container(
        color: Colors.white30,
        padding: EdgeInsets.all(32.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Padding(padding: EdgeInsets.only(top: 30,)),
            SizedBox(height: 130,),
            Image.asset(
              'assets/happycat.gif',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16.0,),
            LinearProgressIndicatorDemo(),
          ],
        ),
      ),
    );
  }
}

class LinearProgressIndicatorDemo extends StatefulWidget {

  @override
  State createState(){
    return LinearProgressIndicatorDemoState();
  }
}

class LinearProgressIndicatorDemoState extends State<LinearProgressIndicatorDemo>
    with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(duration: const Duration(milliseconds:  1100), vsync: this);
    animation=Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {

        });
      });
    controller.repeat();
  }

  @override
  void dispose(){
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
          height: 10,
          child: LinearProgressIndicator (value: animation.value,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
            backgroundColor: Colors.pinkAccent,
            //borderRadius: BorderRadius.circular(100),)
        ),
      )
    );
  }
}