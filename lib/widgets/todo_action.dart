import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/todo_controller/todo_controller.dart';
import 'package:get/get.dart';

class TodoAction extends StatelessWidget {
  TodoAction({Key? key}) : super(key: key);

  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final allTasks = todoController.allTasks;
        return ListView.builder(
          itemCount: allTasks.length,
          itemBuilder: (context, index) {
            final task = allTasks[index];
            return ListTile(
              leading: Checkbox(
                value: task.Completed,
                onChanged: (_) => todoController.toggleTask(task),
              ),
              title: Text(task.todoTitle),
              trailing: IconButton(
                onPressed: () => todoController.deleteTask(task),
                icon: const Icon(Icons.delete),
              ),
            );
          },
        );
      },
    );
  }
}
