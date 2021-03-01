import 'package:flutter/material.dart';
import 'package:flutter_sample_todo/pages/home/components/todo_item.dart';

import '../../model/todo.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _userId = 01;
  List<Todo> _todoList = List();
  TextEditingController _taskEdtCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void onDeleteItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
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
              controller: _taskEdtCtrl,
              decoration: InputDecoration(hintText: 'Enter a task'),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                //Todo: add task to todoList
                final todo = Todo(
                    userId: _userId,
                    id: _todoList.length,
                    title: _taskEdtCtrl.value.text,
                    completed: false);
                setState(() {
                  _todoList.add(todo);
                  _taskEdtCtrl.text = '';
                });
              },
              child: Text(
                'Save',
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: _todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoItem(index + 1, _todoList[index], onDeleteItem);
                })
          ],
        ),
      ),
    );
  }
}
