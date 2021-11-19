import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/entities/todo.dart';

class TodoRepository {
  final SharedPreferences sharedPreferences;

  TodoRepository(this.sharedPreferences);

  void persistTodos(String username, List<Todo> todos) {
    final todoMaps = todos.map((todo) => todo.toJson()).toList();
    final todosJson = json.encode(todoMaps);
    sharedPreferences.setString(username, todosJson);
  }

  List<Todo> loadTodos(String username) {
    final todosJson = sharedPreferences.getString(username);
    print('json: $todosJson');
    if (todosJson != null) {
      final todoMap = json.decode(todosJson) as List;
      List<Todo> todos = todoMap.map((json) => Todo.fromJson(json)).toList();
      return todos;
    }
    // return [];

    // Maaf waktu tidak mencukupi
    // Jadi saya mock datanya agar ada tampilan yg muncul walaupun fitur add todo belum selesai
    return [
      Todo('Todo 1'),
      Todo('Todo 2'),
      Todo('Todo 3'),
      Todo('Todo 4'),
    ];
  }
}
