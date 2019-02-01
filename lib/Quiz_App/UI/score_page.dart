import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/Quiz_App/landing_page.dart';

class ScorePage extends StatelessWidget {

  final int Score;
  final int totalQuestion;


  ScorePage(this.Score, this.totalQuestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           new Text("Your Score: ", style: TextStyle(
             color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold
           ),),
          new Text(Score.toString() + "/" + totalQuestion.toString(), style: TextStyle(
              color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold
          ),),
          new IconButton(icon: Icon(Icons.play_arrow),
              color: Colors.white,
              iconSize: 50.0,
              onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()),
                  (Route route) => route == null))
        ],
      ),
    );
  }
}
