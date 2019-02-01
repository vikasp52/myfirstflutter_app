import 'package:flutter/material.dart';

class InstaStories extends StatelessWidget {
  final topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      new Text(
        "Stories",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      new Row(
        children: <Widget>[
          new Icon(Icons.play_arrow),
          new Text(
            "Watch All",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )
    ],
  );

  final stories =  Expanded(child:
      Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              new Container(
                width: 60.0,
                height: 60.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage("https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg"))
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              index == 0 ? Positioned(
                right: 10.0,
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 10.0,
                  child: new Icon(Icons.add, size: 14.0, color: Colors.white,),
                ),
              ): new Container()
            ],
          )
        ),
      )
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topText,
          stories,
        ],
      ),
    );
  }
}
