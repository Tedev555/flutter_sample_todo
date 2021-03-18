import 'package:flutter/material.dart';
import 'package:flutter_sample_todo/model/todo.dart';

class TodoDetailPage extends StatelessWidget {
  final Todo todo;

  const TodoDetailPage({this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Detail'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${todo.title}',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('User ID: ${todo.userId}'),
            Text('Completed: ${todo.completed}'),
          ],
        ),
      ),
    );
  }
}
