import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskTiles extends StatefulWidget {
  String taskTitle;
  bool isDone;
  Function checkBoxCallback;
  Function longPressCallback;

  TaskTiles({this.taskTitle, this.isDone, this.checkBoxCallback,this.longPressCallback});

  @override
  _TaskTilesState createState() => _TaskTilesState();
}

class _TaskTilesState extends State<TaskTiles> {
  static var newDate = DateTime.now();
  var jar = DateFormat.jm().format(newDate);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${widget.taskTitle} (${jar}) ',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Ubuntu',
          decoration: widget.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: widget.isDone,
        hoverColor: Colors.black,
        activeColor: Color(0xff26a69a),
        onChanged: widget.checkBoxCallback,
      ),
      onLongPress: widget.longPressCallback,
    );
  }
}
