import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_sample_todo/model/todo.dart';

class AppService {
  Future<List<Todo>> fetchTodo() async {
    final url = Uri.https('jsonplaceholder.typicode.com', '/todos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonMap = jsonDecode(response.body);
      return jsonMap.map((item) => Todo.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
