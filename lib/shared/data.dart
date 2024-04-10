import 'package:hive_flutter/hive_flutter.dart';

class MyData {
  List toDoList = [
    ['test1', false],
    ['test2', false],
    ['test3', false]
  ];

  final _myBox = Hive.box('mybox');

  void createInitioalData(){
    toDoList = [];
  }

  void loadData(){

    toDoList = _myBox.get('TODOLIST');
  }

  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }

  void deleteData(List list, index) {
    list.removeAt(index);
    updateData();
  }
}
