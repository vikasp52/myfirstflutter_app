import 'package:flutter/material.dart';

class Calcie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: Calculator(),
    );
  }
}

class CalculatorLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final mainState = MainState.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blueGrey.withOpacity(0.85),
              child: Row(
                children: <Widget>[
                  Text(
                    mainState.inputValue ?? '0',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 48.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: <Widget>[
                    makeBts('C<%/'),
                    makeBts('789X'),
                    makeBts('456-'),
                    makeBts('123+'),
                    makeBts('_0.='),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget makeBts(String row) {
    List<String> token = row.split("");
    return Expanded(
        flex: 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: token
              .map((e) => CalcBtn(
                    keyvalue: e == '_' ? "+/-" : e == '<' ? '≤' : e,
                  ))
              .toList(),
        ));
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String inputstring = "";
  double preValue;
  String value = "";
  String op = 'z';

  bool isNumber(String str){

    if(str == null){
      return false;
    }
    return double.parse(str, (e) => null) != null;
  }

  void onPressed(keyvalue){
    switch(keyvalue){
      case "C":
        op = null;
        preValue = 0.0;
        value = "";
        setState(() => inputstring = "");
        break;
      case ".":
      case "%":
      case "≤":
      case "+/-":
        break;
      case "X":
      case "+":
      case "-":
      case "/":
        op = keyvalue;
        value = "";
        preValue = double.parse(inputstring);
        setState(() {
          inputstring = inputstring + keyvalue;
        });
        break;
      case "=":
        if(op != null){
          setState(() {
            switch(op){
              case "X":
                inputstring = (preValue * double.parse(value)).toStringAsFixed(0);
                break;
              case "+":
                inputstring = (preValue + double.parse(value)).toStringAsFixed(0);
                break;
              case "-":
                inputstring = (preValue - double.parse(value)).toStringAsFixed(0);
                break;
              case "/":
                inputstring = (preValue / double.parse(value)).toStringAsFixed(2);
                break;
            }
          });
          op = null;
          preValue = double.parse(inputstring);
          value = '';
          break;
        }
        break;
      default:
        if(isNumber(keyvalue)){
          if(op != null){
            setState(() {
              inputstring = inputstring + keyvalue;
            });
            value =  value + keyvalue;
          }else{
            setState(() => inputstring = "" + keyvalue);
            op = 'z';
          }
        }else{
          onPressed(keyvalue);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MainState(
        inputValue: inputstring,
      preValue: preValue,
        value: value,
      op: op,
      onPressed: onPressed,
      child: CalculatorLayout(),
    );
  }
}

class MainState extends InheritedWidget {
  MainState({
    Key key,
    this.inputValue,
    this.preValue,
    this.value,
    this.op,
    this.onPressed,
    Widget child,
  }) : super(key: key, child: child);

  final String inputValue;
  final double preValue;
  final String value;
  final String op;
  final Function onPressed;

  static MainState of(BuildContext context){
    return context.inheritFromWidgetOfExactType(MainState);
  }

  @override
  bool updateShouldNotify(MainState oldWidget) {
    // TODO: implement updateShouldNotify
    return inputValue != oldWidget.inputValue;
  }
}

class CalcBtn extends StatelessWidget {
  CalcBtn({this.keyvalue});

  final String keyvalue;

  @override
  Widget build(BuildContext context) {
    final mainState = MainState.of(context);
    return Expanded(
        flex: 1,
        child: FlatButton(
          shape: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2.0,
              style: BorderStyle.solid,),
          color: Colors.white,
          child: Text(
            keyvalue,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 36.0,
                color: Colors.black54,
                fontStyle: FontStyle.normal),
          ),
          onPressed: () {
            mainState.onPressed(keyvalue);
          },
        ));
  }
}
