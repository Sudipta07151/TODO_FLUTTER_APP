import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  final Color colour;
  final int time;
  final String text;
  Badges({
    required this.colour,
    required this.time,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(
        '${text.toUpperCase()} ${time}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

//Provider.of<TaskData>(context).tasksTimeUp
//Provider.of<TaskData>(context).tasksDone
//Provider.of<TaskData>(context).tasksLeftToDo