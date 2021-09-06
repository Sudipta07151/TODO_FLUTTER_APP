import 'package:flutter/cupertino.dart';
import 'dart:collection';
import 'package:flutter/material.dart';
import './task.dart';
import 'dart:async';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  int timeup = 0;
  int left = 0;
  int done = 0;
  int get taskCount {
    return _tasks.length;
  }

  int get tasksLeftToDo {
    left = taskCount - done;
    return left;
  }

  int get tasksDone {
    done = (_tasks.where((element) => element.isDone).toList()).length;
    return done;
  }

  int get tasksTimeUp {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      timeup = (_tasks
              .where((element) => DateTime.now().compareTo(element.time) > 0)
              .toList())
          .length;
      print('RUNNING');
      notifyListeners();
    });
    return timeup;
  }

  void addTaskToList(String task, DateTime date) {
    final taskData = Task(
      name: task,
      time: date,
    );
    _tasks.add(taskData);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void check(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(index) {
    _tasks.removeAt(index - 1);
    notifyListeners();
  }
}
