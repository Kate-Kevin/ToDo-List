import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final Function(bool?)? onChange;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: theme().canvasColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(
              value: taskStatus,
              onChanged: onChange,
              activeColor: theme().primaryColorDark,
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: theme().primaryColor,
                  decoration: taskStatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: theme().primaryColorDark,
                  decorationThickness: 4),
            ),
          ],
        ),
      ),
    );
  }
}
