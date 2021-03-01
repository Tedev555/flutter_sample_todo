import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final _no;
  final _todo;
  final Function _onDelete;

  TodoItem(this._no, this._todo, this._onDelete);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onDelete(_no - 1);
      },
      child: Card(
        child: ListTile(
          title: Text('$_no. ${_todo.title}'),
        ),
      ),
    );
  }
}
