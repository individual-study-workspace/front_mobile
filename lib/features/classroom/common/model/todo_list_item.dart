class TodoListItemModel {
  final String title;
  final DateTime? dueDate;
  final bool isChecked;

  const TodoListItemModel({
    required this.title,
    this.dueDate,
    this.isChecked = false,
  });
}
