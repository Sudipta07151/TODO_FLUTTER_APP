class Task {
  final String name;
  bool isDone;
  DateTime time;
  Task({required this.name, this.isDone = false, required this.time});
  void toggleDone() {
    isDone = !isDone;
  }
}
