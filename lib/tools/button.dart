import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme.dart';

class MyButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: theme().scaffoldBackgroundColor,
      child: Text(
        name,
        style: TextStyle(color: theme().primaryColor),
      ),
    );
  }
}
