import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String equation = "0";
  double result = 0.0;

  var buttonWidth = 60.0, buttonHeight = 60.0;

  var notFirstInput = false, operatorSet = false;

  void enterNumber(String sign) {
    setState((){
      if (!notFirstInput) {
        equation = sign;
        notFirstInput = true;
      } else {
        equation += sign;
      }
      operatorSet = false;
    });
  }

  void enterOperator(String operator) {
    setState((){
      if (operatorSet) {
        equation = equation.substring(0, equation.length - 1);
        equation += operator;
      } else {
        equation += operator;
        operatorSet = true;
      }
      // gleichung += operator;
    });
  }

  void enterResult(double result) {
    setState(() {
      if (operatorSet) {
        equation += result.toString();
        operatorSet = false;
      }
    });
  }

  void clear(bool all) {
    setState((){
      if (all) {
        result = 0.0;
      }
      equation = "0";
      notFirstInput = false;
      operatorSet = false;
    });
  }

  void toggle() {
    setState((){
      if (equation.startsWith("-")) {
        equation = equation.substring(1);
      } else {
        equation = "-" + equation;
      }
    });
  }

  void calculate() {
    setState((){
      Parser p = new Parser();
      Expression exp = p.parse(equation);
      result = exp.evaluate(EvaluationType.REAL,new ContextModel());
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Gleichung: $equation", style: new TextStyle(fontSize: 20.0)),
            new Padding(padding: new EdgeInsets.only(top: 50.0)),
            new Text("Ergebnis: $result", style: new TextStyle(fontSize: 20.0)),
            new Padding(padding: new EdgeInsets.only(top: 50.0)),
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
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  child: new Text("E"),
                  height: buttonHeight,
                  minWidth: buttonWidth,
                  onPressed: () => enterResult(result)
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