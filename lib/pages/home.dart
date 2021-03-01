import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
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
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Text('${++index} sample task');
                })
          ],
        ),
      ),
    );
  }
}
