import 'package:flutter/material.dart';

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
  String gleichung = "";
  num ergebnis = 0;

  var buttonWidth = 50.0, buttonHeight = 50.0;

  void add(){
    setState((){
      gleichung += "+";
    });
  }
  
  void sub(){
    setState((){
      gleichung += "-";
    });
  }

  void mul(){
    setState((){
      gleichung += "*";
    });
  }

  void div(){
    setState((){
      gleichung += "/";
    });

  }

  void nol(){
    setState((){
      gleichung += "0";
    });
  }
  void eins(){
    setState((){
      gleichung += "1";
    });
  }
  void zwei(){
    setState((){
      gleichung += "2";
    });
  }
  void drei(){
    setState((){
      gleichung += "3";
    });
  }
  void vier(){
    setState((){
      gleichung += "4";
    });
  }
  void fuenf(){
    setState((){
      gleichung += "5";
    });
  }

  void sechs(){
    setState((){
      gleichung += "6";
    });
  }

  void sieben(){
    setState((){
      gleichung += "7";
    });
  }
  void acht(){
    setState((){
      gleichung += "8";
    });
  }

  void neun(){
    setState((){
      gleichung += "9";
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Gleichung: $gleichung"),
            new Text("$ergebnis"),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("1"),
                  onPressed: eins,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("2"),
                  onPressed: zwei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("3"),
                  onPressed: drei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("+"),
                  onPressed: add,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("1"),
                  onPressed: eins,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("2"),
                  onPressed: zwei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("3"),
                  onPressed: drei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("+"),
                  onPressed: add,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("1"),
                  onPressed: eins,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("2"),
                  onPressed: zwei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("3"),
                  onPressed: drei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("+"),
                  onPressed: add,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("1"),
                  onPressed: eins,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("2"),
                  onPressed: zwei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("3"),
                  onPressed: drei,
                  height: buttonHeight,
                  minWidth: buttonWidth,
                ),
                new MaterialButton(
                  child: new Text("+"),
                  onPressed: add,
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
                  onPressed: () => {},
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