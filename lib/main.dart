import 'package:flutter/material.dart';
import 'package:flutter_sample_todo/pages/home.dart';
import 'package:flutter_sample_todo/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}
