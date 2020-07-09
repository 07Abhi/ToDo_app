class Task{
  String taskName;
  bool isChecked;
  Task({this.taskName,this.isChecked=false});
  void toogleCheckBox(){
    isChecked = !isChecked;
  }
}