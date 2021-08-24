import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.getTask(index);
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              callbackFunc: (bool? checkboxState) {
                // setState(() {
                //   widget.tasks[index].isDone =
                //       checkboxState != null ? checkboxState : false;
                // });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
