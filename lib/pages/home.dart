import 'package:flutter/material.dart';

import '../model/todo.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todoList = List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      final todo =
          Todo(userId: 01, id: i, title: 'sample task $i', completed: false);
      _todoList.add(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Enter a task'),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {},
              child: Text(
                'Save',
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: _todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildTodoItem(index);
                })
          ],
        ),
      ),
    );
  }

  Widget _buildTodoItem(int index) {
    return Card(
      child: ListTile(
        // leading: FlutterLoFlutterLogogo(),
        title: Text('${++index} One-line with both widgets'),
        // trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
