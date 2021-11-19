import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String task;
  bool complete;
  DateTime dueDate;

  Todo(
    this.task, {
    String id,
    this.complete = false,
    DateTime dueDate,
  })  : this.id = id ?? Uuid().v4(),
        this.dueDate = dueDate ?? DateTime.now();

  Todo.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.task = json['task'];
    this.complete = json['complete'];
    this.dueDate = json['dueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['task'] = this.task;
    data['complete'] = this.complete;
    data['dueDate'] = this.dueDate;

    return data;
  }
}
