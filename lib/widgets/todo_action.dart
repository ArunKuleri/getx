import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../model/todo_model/todomodel.dart';

class TodoController {
  final List<TodoModel> _tasks = [];

  List<TodoModel> get allTasks => _tasks;

  void addTask(String task) {
    _tasks.add(TodoModel(todoTitle: task, completed: false));
  }

  void deleteTask(TodoModel task) {
    _tasks.remove(task);
  }
}

class TodoAction extends StatefulWidget {
  TodoAction({Key? key}) : super(key: key);

  @override
  _TodoActionState createState() => _TodoActionState();
}

class _TodoActionState extends State<TodoAction> {
  final TodoController todoController = TodoController();
  bool _isCompeleted = false;
  @override
  Widget build(BuildContext context) {
    final allTasks = todoController.allTasks;
    return ListView.builder(
      itemCount: allTasks.length,
      itemBuilder: (context, index) {
        final task = todoController.allTasks[index];
        return ListTile(
          title: Text(task.todoTitle),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                todoController.deleteTask(task);
              });
              CheckboxListTile(
                title: const Text('Completed'),
                value: _isCompeleted,
                onChanged: (value) {
                  setState(() {
                    _isCompeleted = value!;
                  });
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
