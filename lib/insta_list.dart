import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/insta_stories.dart';

class InstaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return new ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => index == 0
          ? new SizedBox(
              child: new InstaStories(),
              height: deviceSize.height * 0.15,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // 1st Row
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
                            ),
                          ),
                          new SizedBox(
                            width: 10.0,
                          ),
                          new Text(
                            "Vikas",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      new IconButton(
                          icon: Icon(Icons.more_vert), onPressed: null)
                    ],
                  ),
                ),
                // 2nd Row
                Flexible(
                  fit: FlexFit.loose,
                  child: new Image.network("https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                  fit: BoxFit.cover,),
                ),
                // 3rd Row
                Padding(padding: EdgeInsets.all(16.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new IconButton(icon: Icon(Icons.build),
                            onPressed: (){}),
                        new IconButton(icon: Icon(Icons.hearing),
                            onPressed: null),
                        new IconButton(icon: Icon(Icons.favorite),
                            onPressed: null),
                      ],
                    ),
                    new IconButton(icon: Icon(Icons.camera),
                        onPressed: (){})
                    ],
                ),
                ),
                //4th Row
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Text("Liked by Satyam, Sunil and 331 others",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                ),

                //5th Row
                Padding(padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg"),
                          )
                      ),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: new TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.blueAccent,
                            hintText: "Add a comment...",
                          ),
                        )
                    )
                  ],
                ),
                ),
                //6th Row
                Padding(padding: EdgeInsets.all(10.0),
                child: Text("2 days ago..."),)
              ],
            ),
    );
  }
}
