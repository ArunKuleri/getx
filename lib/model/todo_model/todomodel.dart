// ignore_for_file: non_constant_identifier_names

class TodoModel {
  String todoTitle;
  bool Completed;
  TodoModel({
    this.Completed = false,
    required this.todoTitle,
  });
  void toggleCompleted() {
    Completed = !Completed;
  }
}
