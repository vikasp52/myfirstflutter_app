import 'package:flutter/material.dart';

class DialogExample extends StatefulWidget {
  @override
  _DialogExampleState createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  List<String> Names = [
    'Controler 1',
    'Controler 2',
    'Controler 3',
    'Controler 4',
    'Controler 5',
    'Controler 6',
    'Controler 7',
    'Controler 8',
    'Controler 9',
    'Controler 10',
    'Controler 11',
    'Controler 12',
    'Controler 13',
    'Controler 14',
    'Controler 15'
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("PopUp Example"),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
          child: new ListView.builder(
            reverse: false,
            itemBuilder: (_, int index) => EachList(this.Names[index]),
            itemCount: this.Names.length,
          ),
        ),
        floatingActionButton: new CustomFloatingButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => new SimpleDialog(
                      title: new Text("Add Controler"),
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                  ),
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Number",
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Center(
                                        child: RawMaterialButton(
                                          onPressed: null,
                                          fillColor: Colors.indigo,
                                          splashColor: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 6.0),
                                            child: Text(
                                              "SUBMIT",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          shape: const StadiumBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 22.0,
                                    ),
                                    RawMaterialButton(
                                      onPressed: null,
                                      fillColor: Colors.deepOrange,
                                      splashColor: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.0),
                                        child: Text(
                                          "CANCEL",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      shape: const StadiumBorder(),
                                    ),
                                  ],
                                )
                              ],
                            ))
                      ],
                    ));
          },
        ));
  }
}

//Custom Floating Button
class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.indigo,
      splashColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Text(
          "ADD CONTROLER",
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

//List Items
class EachList extends StatelessWidget {
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(
              child: new Text(name[0]),
            ),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(
              name,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
