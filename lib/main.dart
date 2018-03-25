import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String gleichung = "0";
  var ergebnis = 0.0;

  var buttonWidth = 50.0, buttonHeight = 50.0;

  var notFirstInput = false, operatorSet = false;

  void enterNumber(String sign) {
    setState((){
      if (!notFirstInput) {
        gleichung = sign;
        notFirstInput = true;
      } else {
        gleichung += sign;
      }
    });
  }

  void enterOperator(String operator) {
    setState((){
      if (operatorSet) {
        gleichung = gleichung.substring(0, gleichung.length - 1);
        gleichung += operator;
      } else {
        gleichung += operator;
        operatorSet = true;
      }
      // gleichung += operator;
    });
  }

  void clear(bool all) {
    setState((){
      if (all)
        ergebnis = 0.0;
      gleichung = "0";
      notFirstInput = false;
      operatorSet = false;
    });
  }

  void toggle() {
    setState((){
      if (gleichung.startsWith("-")) {
        gleichung = gleichung.substring(1);
      } else {
        gleichung = "-" + gleichung;
      }
    });
  }

  void calculate() {
    setState((){
      Parser p = new Parser();
      Expression exp = p.parse(gleichung);
      ergebnis = exp.evaluate(EvaluationType.REAL,new ContextModel());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("Gleichung: $gleichung", style: new TextStyle(fontSize: 20.0)),
            new Text("Ergebnis: $ergebnis", style: new TextStyle(fontSize: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("1"),
                  onPressed: () => enterNumber("1"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("2"),
                  onPressed: () => enterNumber("2"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("3"),
                  onPressed: () => enterNumber("3"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("+"),
                  onPressed: () => enterOperator("+"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("4"),
                  onPressed: () => enterNumber("4"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("5"),
                  onPressed: () => enterNumber("5"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("6"),
                  onPressed: () => enterNumber("6"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  onPressed: () => enterOperator("-"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("7"),
                  onPressed: () => enterNumber("7"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("8"),
                  onPressed: () => enterNumber("8"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("9"),
                  onPressed: () => enterNumber("9"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("*"),
                  onPressed:() => enterOperator("*"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+/-"),
                  onPressed: toggle,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("0"),
                  onPressed: () => enterNumber("0"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("."),
                  onPressed: () => enterOperator("."),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  onPressed: () => enterOperator("/"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("C",style: new TextStyle(color: Colors.red)),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                  onPressed: () => clear(false),
                ),
                new MaterialButton(
                  child: new Text("CE",style: new TextStyle(color: Colors.red)),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                  onPressed: () => clear(true),
                ),
                new MaterialButton(
                  child: new Text("E",style: new TextStyle(color: Colors.red)),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                  onPressed: () => enterNumber(ergebnis.toString())
                ),
                new MaterialButton(
                  color: Colors.blue,
                  child: new Text("=", style: new TextStyle(color: Colors.white)),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                  onPressed: calculate,
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}