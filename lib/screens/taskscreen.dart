import 'package:flutter/material.dart';
import '../WidgetsFolder/task_list.dart';
import '../WidgetsFolder/app_bar.dart';
import 'bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';
import 'dart:async';

class TasksScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade600,
        elevation: 1,
        leading: AppBarAvatar(),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: OutlinedButtonTheme(
              data: OutlinedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(
                    Size.fromWidth(80),
                  ),
                  overlayColor:
                      MaterialStateProperty.all(Colors.orange.shade50),
                ),
              ),
              child: OutlinedButton(
                onPressed: () {},
                child: Icon(
                  Icons.login,
                  color: Colors.red.shade700,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.orange.shade800,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskModal(),
          );
        },
        elevation: 0,
        backgroundColor: Colors.orange.shade700,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 40,
                        color: Colors.red.shade400,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'TODO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tasks ${Provider.of<TaskData>(context).tasks.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Done ${Provider.of<TaskData>(context).tasksDone}',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.green.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'TimeUp ${Provider.of<TaskData>(context).tasksTimeUp}',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.yellow.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Left ${Provider.of<TaskData>(context).tasksLeftToDo}',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.yellow.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 25,
                left: 30,
                right: 30,
              ),
              child: TaskList(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(200, 100),
                  topLeft: Radius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
