import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';


class TodoAPI {
    Future<List<Todo>> getTodos() async {
        await Future.delayed(const Duration(seconds: 1)); 
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

        if (response.statusCode == 200) {
            final data = jsonDecode(response.body); 
            final todos = <Todo>[];

            for (var element in data) {
                todos.add(Todo.fromJson(element));
            }

            return todos;
        } else {
            return [];
        }
    }
}