import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:todoapp/entities/todo.dart';
import 'package:todoapp/repositories.dart/todo_repository.dart';
import 'package:todoapp/viewmodels/login_view_model.dart';
import 'package:todoapp/viewmodels/todo_view_model.dart';

class TodosViewModel extends ChangeNotifier {
  String username;
  List<TodoViewModel> todos = [];
  final TodoRepository repository;

  TodosViewModel(this.repository);

  void update(LoginViewModel loginViewModel) {
    username = loginViewModel.username;
  }

  void loadTodos() {
    todos = repository
        .loadTodos(username)
        .map((todo) => TodoViewModel(todo))
        .toList();
    notifyListeners();
  }

  void addTodo(Todo newTodo) {
    final todoViewModel = TodoViewModel(newTodo);
    todos.add(todoViewModel);
    final todoEntities = todos.map((model) => model.todo).toList();
    repository.persistTodos(username, todoEntities);
    notifyListeners();
  }
}
