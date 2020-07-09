import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:todoapp/models/taskelements.dart';

class TaskManagement extends ChangeNotifier {
  List<Task> _tasks = [

  ];
  int get listLegth{
    return _tasks.length;

  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
  void updateTask(Task task) {
    task.toogleCheckBox();
    notifyListeners();
  }

  void addTask(String str) {
    _tasks.add(
      Task(taskName: str),
    );
    notifyListeners();
  }
/*We dont want user to make direct interaction with list*/
  UnmodifiableListView<Task> get taskLists {
    return UnmodifiableListView(_tasks);
  }
}
