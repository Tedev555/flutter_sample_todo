import 'package:flutter/material.dart';
import 'package:flutter_sample_todo/AppService.dart';
import 'package:flutter_sample_todo/model/todo.dart';
import 'package:flutter_sample_todo/pages/todo_detail.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todoList;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getTodoData();
  }

  Future<void> _getTodoData() async {
    final todoData = await AppService().fetchTodo();
    setState(() {
      _todoList = todoData;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          // TextField(
          //   decoration: InputDecoration(hintText: 'Enter a task'),
          // ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text(
          //     'Save',
          //   ),
          // ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                Todo todo = _todoList[index];

                return ListTile(
                    title: Text(todo.title),
                    subtitle: Text('User: ${todo.userId}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TodoDetailPage(todo: todo)),
                      );
                    });
              })
        ],
      ),
    );
  }
}
