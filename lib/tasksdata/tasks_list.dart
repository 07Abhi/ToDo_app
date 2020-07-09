import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/Taskmanagement.dart';
import 'package:todoapp/tasksdata/task_tiles.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskManagement>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTiles(
              taskTitle: taskData.taskLists[index].taskName,
              isDone: taskData.taskLists[index].isChecked,
              checkBoxCallback: (value) {
                taskData.updateTask(taskData.taskLists[index]);
                if(value){
                  FlutterToast.showToast(
                      msg: 'Task Done',
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      textColor: Colors.white,
                      backgroundColor: Colors.grey,
                      timeInSecForIosWeb: 1
                  );
                }
              },
              longPressCallback: (){
                taskData.deleteTask(taskData.taskLists[index]);
                FlutterToast.showToast(
                    msg: 'Task Deleted!!',
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    textColor: Colors.white,
                    backgroundColor: Colors.grey,
                    timeInSecForIosWeb: 1
                );
              },
            );
          },
          itemCount: taskData.taskLists.length,
        );
      },
    );
  }
}
/*
* return TaskTiles(
          taskTitle:
              Provider.of<TaskManagement>(context).taskLists[index].taskName,
          isDone: Provider.of<TaskManagement>(context).taskLists[index].isChecked,
          checkBoxCallback:
        );*/
