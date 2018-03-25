import 'package:flutter/material.dart';
import 'MyHomePage.dart';

// import 'package:csslib/parser.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:io/io.dart';
import 'package:audioplayer/audioplayer.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'calc-JokingWolf',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'calc-JokingWolf'),
    );
  }
}