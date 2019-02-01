import 'dart:async';

import 'package:flutter/material.dart';

class InputList extends StatefulWidget {

  @override
  _InputListState createState() => _InputListState();
}

class _InputListState extends State<InputList> {
  //List widget = [];
  final myController = TextEditingController();
 // final input = myController.text.toString();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Card(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: myController,
                autofocus: true,
                onChanged: (str){
                  setState(() {
                    str = myController.text;
                  });
                },
              ),
              Center(
                child: Container(
                  child: Text(myController.text,style: TextStyle(fontSize: 20.0),),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }

  void test() {
    var input = myController.text.toString();

    print("test" + input);

    for(int i = 0; i < input.length; i++){
      print(i);
    }

  }

  }

