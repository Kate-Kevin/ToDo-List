import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final Function(bool?) onChange;
  final Function delete;
  final Animation<double> animation;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChange,
    required this.delete,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: theme().canvasColor,
              borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Checkbox(
              value: taskStatus,
              onChanged: onChange,
              activeColor: theme().primaryColorDark,
            ),
            title: SizedBox(
              width: MediaQuery.of(context).size.width - 200,
              child: Text(
                taskName,
                softWrap: true,
                style: TextStyle(
                    color: theme().primaryColor,
                    decoration: taskStatus
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: theme().primaryColorDark,
                    decorationThickness: 4),
              ),
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                )
              ],
              onSelected: (value) {
                if (value == 'delete') {
                  delete();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
