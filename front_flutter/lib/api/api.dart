import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  TodoProvider() {
    this.fectchTasks();
  }
  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  fectchTasks() async {
    final url = Uri.parse('http://10.0.2.2:8000/apis/v1/?format=json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
      print(data);
    }
  }
}
