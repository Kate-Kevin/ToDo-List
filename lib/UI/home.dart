import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/UI/dialog_box.dart';
import 'package:todo_list/UI/todo_tile.dart';
import 'package:todo_list/shared/data.dart';
import 'package:todo_list/shared/logic.dart';

import '../shared/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  final _myBox = Hive.box('mybox');
  MyData db = MyData();

  final listKey = GlobalKey<AnimatedListState>();
  @override
  void initState(){
    if (_myBox.get('TODOLIST')==null) {
      db.createInitioalData();
    }else{
      db.loadData();
    }

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme().scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme().primaryColorDark,
          title: Text(
            'Task',
            style: TextStyle(color: theme().primaryColor),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DialogBox(
                    controller: _controller,
                    save: () {
                      setState(() {
                        Logic().save(db.toDoList, _controller);
                      });
                      db.updateData();
                      Navigator.of(context).pop();
                      _controller.clear();
                      listKey.currentState!.insertItem(0);
                    },
                  );
                });
          },
          backgroundColor: theme().canvasColor,
          child: const Icon(Icons.add),
        ),
        body: AnimatedList(
            key: listKey,
            initialItemCount: db.toDoList.length,
            itemBuilder: (context, index, animation) {
              return TodoTile(
                  animation: animation,
                  taskName: db.toDoList[index][0],
                  taskStatus: db.toDoList[index][1],
                  delete: () {
                    setState(() {
                      final itemRemove= db.toDoList[index];

                      db.deleteData(db.toDoList, index);

                      listKey.currentState!.removeItem(
                        index,
                        (context, animation) => TodoTile(
                            taskName: itemRemove[0],
                            taskStatus: itemRemove[1],
                            onChange: (value) {},
                            delete: () {},
                            animation: animation),
                      );
                    });
                  },
                  onChange: (value) {
                    setState(() {
                      db.toDoList[index][1] = !db.toDoList[index][1];
                    });
                    db.updateData();
                  });
            }));
  }
}
