import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
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
