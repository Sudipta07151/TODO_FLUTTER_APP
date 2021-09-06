import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final DateTime dateTime;
  final Function checkBoxCallBack;
  final Function deleteTask;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.dateTime,
      required this.checkBoxCallBack,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: () {
          deleteTask();
        },
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(DateFormat.E().add_jms().format(dateTime)),
        trailing: Checkbox(
          fillColor: MaterialStateProperty.all(Colors.orange),
          checkColor: Colors.orange.shade500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          activeColor: Colors.white,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          value: isChecked,
          onChanged: (value) {
            checkBoxCallBack(value);
          },
        ));
  }
}
