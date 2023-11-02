import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/todo_controller/todo_controller.dart';
import 'package:flutter_application_1/widgets/todo_action.dart';
import 'package:get/get.dart';

class TodoPage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();
  final TodoController todoContoller = Get.put(TodoController());

  TodoPage({super.key});
  void _showAddTextDialog() {
    Get.defaultDialog(
        title: "Add a new Task",
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
        textConfirm: "Submit",
        onConfirm: () {
          if (_textFieldController.text.isEmpty) {
            Get.snackbar("Validation Error", "Please enter a task.");
          } else {
            _submit();
          }
        });
  }

  void _submit() {
    todoContoller.addTask(_textFieldController.text);
    Get.back();
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
