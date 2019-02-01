import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/Quiz_App/quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  QuizPage()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Lets Quizzz", style: TextStyle(color: Colors.black, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Text("Tap to start", style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
