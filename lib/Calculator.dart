import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/insta_home.dart';
import 'main.dart';

void main(){
  runApp(new MYAPP());
}

class MYAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Instagram",
      theme: new ThemeData(
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(
          color: Colors.black),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.black)),
        textTheme: TextTheme(title: TextStyle(color: Colors.black))
      ),
      home: new InstaHome(),
    );
  }
}

/*class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Calculator Page"),
      ),
      body:
    );
  }
}*/

