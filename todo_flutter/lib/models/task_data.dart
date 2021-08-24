import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread', isDone: true),
  ];

  int get taskCount {
    return _tasks.length;
  }

  Task getTask(int index) {
    return _tasks[index];
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    print(newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
}
