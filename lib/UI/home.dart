import 'package:flutter/material.dart';
import 'package:todo_list/UI/dialog_box.dart';
import 'package:todo_list/UI/todo_tile.dart';
import 'package:todo_list/shared/logic.dart';

import '../shared/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();

  List toDoList = [
    ["task1", false],
    ["task2", false],
  ];

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
                        Logic().save(toDoList, _controller);
                      });
                      Navigator.of(context).pop();
                    },
                  );
                });
          },
          backgroundColor: theme().canvasColor,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                  taskName: toDoList[index][0],
                  taskStatus: toDoList[index][1],
                  onChange: (value) {
                    setState(() {
                      toDoList[index][1] = !toDoList[index][1];
                    });
                  });
            }));
  }
}
