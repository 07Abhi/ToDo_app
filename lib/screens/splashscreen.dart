import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:todoapp/screens/taskscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<String> appname = ['Tasky'];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  child: Image.asset('images/todologo.png'),
                ),
                SizedBox(
                  width: 2.0,
                ),
                Container(
                  height: 75.0,
                  child: VerticalDivider(
                    thickness: 3.0,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  width: 2.0,
                ),
                TypewriterAnimatedTextKit(
                  text: appname,
                  textStyle: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.black54),
                  totalRepeatCount: 1,
                  speed: Duration(seconds: 1),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'A Simple Task Manager',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: Colors.black54
              ),
            ),
          ],
        ),
      ),
    );
  }
}
