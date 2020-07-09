import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/Taskmanagement.dart';
class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskText;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add Task',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Color(0xff26a69a),
                ),
              ),
              TextField(
                controller: textController,
                onChanged: (value) {
                  taskText = value;
                },
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff757575),
                      width: 2.0,
                    ),
                  ),
                  hintText: 'Task',
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 40.0,
                width: 180.0,
                child: FlatButton(
                  onPressed: () {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    if (taskText != null) {
                      FlutterToast.showToast(
                          msg: 'Task Added',
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          textColor: Colors.white,
                          backgroundColor: Colors.grey,
                          timeInSecForIosWeb: 1);
                    }
                    Provider.of<TaskManagement>(context,listen: false).addTask(taskText);
                    textController.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Color(0xff26a69a),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
