import 'package:flutter/material.dart';
import 'package:todoapp/constants/styles.dart';

class FAQpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff26a69a),
        title: Text(
          'FAQ\'s',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Q1. How to Add tasks?', style: KquestionStyle),
            SizedBox(height: 15.0),
            Text(
              'Ans. Click on the Floating button present at right bottom to add the task!!',
              style: KanswerStyle,
            ),
            SizedBox(height: 15.0,),
            Text('Q2. How to Delete tasks?', style: KquestionStyle),
            SizedBox(height: 15.0),
            Text(
              'Ans. Make an long press with task title after completing or before completing the task!!',
              style: KanswerStyle,
            ),
            SizedBox(height: 15.0,),
            Text('Q3. How to completed task look like?', style: KquestionStyle),
            SizedBox(height: 15.0),
            Text(
              'Ans. After you click on the checkbox at the right of the title track the title on the task get cut by an line.!!',
              style: KanswerStyle,
            ),
            SizedBox(height: 15.0,),
            Text('Q4. Is there any alert notification of the Task?', style: KquestionStyle),
            SizedBox(height: 15.0),
            Text(
              'Ans. Not so far but our developer is working on it!!',
              style: KanswerStyle,
            ),
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Container(
                height: 100.0,
                width: 100.0,
                child: Image.asset('images/todologo.png'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
