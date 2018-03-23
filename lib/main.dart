import 'package:flutter/material.dart';
import 'courses.dart';

void main() => runApp(new App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Courses',
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      home: new CoursePage(),
    );
  }
}

