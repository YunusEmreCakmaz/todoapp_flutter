import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final taskItem = taskData.tasks[index];
          return TaskTile(
            taskTitle: taskItem.name,
            isChecked: taskItem.isDone,
            checkBoxCallback: (checkBoxState) {
              taskData.updateTask(taskItem);
            },
            longPressCallback: () {
              taskData.removeTask(taskItem);
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
