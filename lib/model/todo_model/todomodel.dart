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
