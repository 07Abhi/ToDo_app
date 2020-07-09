import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/screens/faq_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/models/Taskmanagement.dart';
import 'package:todoapp/screens/addtaskscreen.dart';
import 'package:provider/provider.dart';
import '../tasksdata/tasks_list.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool visibilty = true;
  var newDate;
  var onlyDate;

  @override
  void initState() {
    super.initState();
    newDate = DateTime.now();
    var date = new DateFormat('yy-MM-dd');
    onlyDate = date.format(newDate);
    print(onlyDate);
    FlutterToast.showToast(
        msg: 'Welcome',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff26a69a),
        floatingActionButton: FloatingActionButton(
          splashColor: Color(0xffb2dfdb),
          child: Icon(
            Icons.add,
            size: 25.0,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  ),
                );
              },
            );
          },
          backgroundColor: Color(0xff26a69a),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: Icon(
                        Icons.check,
                        size: 40.0,
                        color: Color(0xff26a69a),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FAQpage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Tasky',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 50.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${Provider.of<TaskManagement>(context).listLegth} Task',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Task List',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                ),
                Visibility(
                  visible: (Provider.of<TaskManagement>(context).listLegth > 0)
                      ? false
                      : true,
                  child: Text(
                    ' (No Tasks)',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ),
                Visibility(
                  visible: (Provider.of<TaskManagement>(context).listLegth > 0)
                      ? true
                      : false,
                  child: Text(
                    ' ($onlyDate)',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TaskList(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
