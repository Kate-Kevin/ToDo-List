import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme.dart';
import 'package:todo_list/tools/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final save ; 
  const DialogBox({
    super.key,
    required this.controller,
    required this.save
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: theme().canvasColor,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Add New Task",
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(name: 'Save', onPressed:save),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                    name: 'Cancel',
                    onPressed: () => Navigator.of(context).pop())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
