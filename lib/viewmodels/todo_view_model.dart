import 'package:flutter/cupertino.dart';
import 'package:todoapp/entities/todo.dart';

class TodoViewModel extends ChangeNotifier {
  Todo todo;

  TodoViewModel(this.todo);

  void markAsComplete() {
    todo.complete = !todo.complete;
    notifyListeners();
  }
}
