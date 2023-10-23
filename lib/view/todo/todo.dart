import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/todo_controller/todo_controller.dart';
import 'package:flutter_application_1/widgets/todo_action.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/todo_model/todomodel.dart';

class TodoPage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();
  final TodoController todoContoller = Get.put(TodoController());
  void _showAddTextDialog() {
    Get.defaultDialog(
      title: "Add a new Task",
      content: TextField(
        autofocus: true,
        controller: _textFieldController,
        decoration: InputDecoration(hintText: "Add New Task"),
        onSubmitted: (_) => _submit(),
      ),
      textConfirm: "Submit",
      onConfirm: _submit,
    );
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
        title: Text("Tasks"),
      ),
      body: TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTextDialog,
        tooltip: "Add a Todo",
        child: Icon(Icons.add),
      ),
    );
  }
}
