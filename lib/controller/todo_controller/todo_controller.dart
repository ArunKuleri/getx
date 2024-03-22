// import 'package:get/get.dart';
// import 'package:flutter_application_1/model/todo_model/todomodel.dart';

// class TodoController extends GetxController {
//   final RxList<TodoModel> _tasks = <TodoModel>[].obs;
//   List<TodoModel> get allTasks => _tasks;

//   void addTask(String task) {
//     _tasks.add(TodoModel(
//       todoTitle: task,
//       Completed: false,
//     ));
//   }

//   void toggleTask(TodoModel task) {
//     final taskIndex = _tasks.indexWhere((t) => t == task);
//     if (taskIndex != -1) {
//       _tasks[taskIndex].toggleCompleted();
//     }
//   }

//   void deleteTask(TodoModel task) {
//     _tasks.remove(task);
//   }
// }
