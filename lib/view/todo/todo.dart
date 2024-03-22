import 'package:flutter/material.dart';

import 'package:flutter_application_1/model/todo_model/todomodel.dart';
import 'package:flutter_application_1/widgets/todo_action.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textFieldController = TextEditingController();
  bool _isCompeleted = false;
  final List<TodoModel> _task = [];
  List<TodoModel> get allTask => _task;
  void addTask(String task) {
    setState(() {
      _task.add(TodoModel(
        todoTitle: task,
        completed: false,
      ));
    });
  }

  void toggleTask(TodoModel task) {
    setState(() {
      final taskIndex = _task.indexWhere((t) => t == task);
      if (taskIndex != -1) {
        _task[taskIndex].toggleCompleted();
      }
    });
  }

  void deleteTask(TodoModel task) {
    setState(() {
      _task.remove(task);
    });
  }

  void _showAddTextDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add a new Task"),
          content: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _textFieldController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter a task";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Add New Task"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_textFieldController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Validation Error: Please enter a task."),
                    ),
                  );
                } else {
                  _submit();
                }
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  void _submit() {
    setState(() {
      addTask(_textFieldController.text);
      _isCompeleted = false;
    });
    Navigator.of(context).pop(); // Use Navigator to close the dialog
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTextDialog,
        tooltip: "Add a Todo",
        child: const Icon(Icons.add),
      ),
    );
  }
}
