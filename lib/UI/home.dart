import 'package:flutter/material.dart';
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
  MyData db = MyData();
  

  @override
  Widget build(BuildContext context) {
    
    db.loadData();

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
                    },
                  );
                });
          },
          backgroundColor: theme().canvasColor,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                  taskName: db.toDoList[index][0],
                  taskStatus: db.toDoList[index][1],
                  delete: () {
                    setState(() {
                      db.toDoList.removeAt(index);
                    });
                    db.updateData();
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
