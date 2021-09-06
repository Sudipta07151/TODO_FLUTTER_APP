import 'package:flutter/material.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name.toUpperCase(),
              dateTime: taskData.tasks[index].time,
              checkBoxCallBack: (checkboxState) {
                taskData.check(index);
              },
              deleteTask: () {
                taskData.deleteTask(index + 1);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
