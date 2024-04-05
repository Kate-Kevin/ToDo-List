import 'package:hive_flutter/hive_flutter.dart';

class MyData{
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  void loadData(){
    toDoList = _myBox.get('TODOLIST');
  }

  void updateData(){
    _myBox.put('TODOLIST', toDoList);
  }
}