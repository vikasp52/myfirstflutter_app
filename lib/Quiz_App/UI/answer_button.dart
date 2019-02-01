import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final VoidCallback _onTap;
  final bool _answer;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: new Material(
      color: _answer == true? Colors.greenAccent: Colors.redAccent,
      child: new InkWell(
        onTap: () => _onTap(),
        child: new Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 5.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_answer == true? "True": "False", style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.black
              ),),
            ),
          ),
        ),
      ),
    ));
  }
}

