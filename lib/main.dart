import 'dart:async';
import 'package:myfirstflutter_app/ListOfPaages.dart';

import 'Calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

//Normal LoginPage
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(home: new LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationControler;
  Animation<double> _iconanimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationControler = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 500));
    _iconanimation = new CurvedAnimation(
        parent: _iconAnimationControler, curve: Curves.easeOut);
    _iconanimation.addListener(() => this.setState(() {}));
    _iconAnimationControler.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.amber,
      body: new Container(
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlutterLogo(
              size: _iconanimation.value * 100,
            ),
            new Form(
                child: new Container(
                    padding: const EdgeInsets.all(30.0),
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(padding: EdgeInsets.only(top: 20.0)),
                        new MaterialButton(
                            textColor: Colors.white,
                            color: Colors.indigo,
                            child: new Text("Login"),
                            splashColor: Colors.amber,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListOfApps()),
                              );
                            })
                      ],
                    )))
          ],
        )),
      ),
    );
  }
}

// Model Data Class
class ModelData {
  String text;
  String text2;

  ModelData(this.text, this.text2);

  ModelData.empty() {
    text = "";
    text2 = "";
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool showDialog = false;
  List _item = [];

  double age = 0.0;
  var selectedYear;

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void _showPicker(){
    showDatePicker(context: context,
        initialDate: new DateTime(2018),
        firstDate: DateTime(1900),
        lastDate: DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        calculateAge();
      });
    });
  }

  void calculateAge(){
    setState(() {
      age = (2018 - selectedYear).toDouble();
      print("Your age" + age.toString());
    });
  }
  /*Future _openDialogAddItem() async {
    ModelData data = await Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new DialogAddItem();
        },
        fullscreenDialog: true,),
    );
    setState(() {
      _item.add(data);
    });
  }*/

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: AppBar(
          title: Text("Age Calculator"),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MYAPP()));
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.add),),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new OutlineButton(
                child: new Text(selectedYear != null ? selectedYear.toString(): "Select your year of birth",),
                borderSide: new BorderSide(color: Colors.black, width: 3.0),
                color: Colors.black,
                onPressed: _showPicker),
            new Padding(padding: EdgeInsets.all(20.0)),
            new Text("Your Age is ${age.toStringAsFixed(0)}", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
  /*Widget getRow(int position) {
    return new FlatButton(
        child: new ListTile(
          title: new Text(_item[position].text),
          subtitle: new Text(_item[position].text2),
        ),
        onPressed: () {
          setState(() {
            _item.removeAt(position);
          });
        });
  }*/
}

/*class DialogAddItem extends StatefulWidget {
  @override
  _DialogAddItemState createState() => _DialogAddItemState();
}

class _DialogAddItemState extends State<DialogAddItem> {
  bool _canSave = false;
  ModelData _data = new ModelData.empty();

  void _setCanSave(bool save) {
    if (save != _canSave) {
      setState(() {
        _canSave = save;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Add new Item"),
        actions: <Widget>[
          new FlatButton(
              onPressed: _canSave
                  ? () {
                      Navigator.of(context).pop(_data);
                    }
                  : null,
              child: new Text(
                'ADD',
                style: theme.textTheme.body1.copyWith(
                    color: _canSave
                        ? Colors.white
                        : new Color.fromRGBO(255, 255, 255, 0.5)),
              ))
        ],
      ),
      body: new Form(
          child: new ListView(
        //padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        children: <Widget>[
          new TextField(
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (String value) {
                  if(value != null){
                    _data.text = value;if(value != null){
                      _data.text = value;
                      _setCanSave(value.isNotEmpty);
                    }else{
                      print("Value was null");
                    }
                    _setCanSave(value.isNotEmpty);
                  }else{
                    print("Value was null");
                  }
                },
              ),
          new TextField(
              decoration: InputDecoration(labelText: "Number"),
              onChanged: (String value) {
                if(value != null){
                  _data.text2 = value;
                  _setCanSave(value.isNotEmpty);
                }else{
                  print("Value was null");
                }

              },
            ),
        ],
      )),
    );
  }
}*/

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new HomePage(),
      theme: new ThemeData(
          backgroundColor: Colors.deepOrangeAccent,
          accentColor: Colors.amber,
          brightness: Brightness.light),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mytext = "Hello World";

  void _changetext() {
    setState(() {
      if (mytext.startsWith("H")) {
        mytext = "Welcome to my app";
      } else {
        mytext = "Hello World";
      }
    });
  }

  Widget _BodyWidget() {
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            mytext,
            style: new TextStyle(fontSize: 30.0, color: Colors.white70),
          ),
          new RaisedButton(
              child: new Text("Click Here"),
              color: Colors.amberAccent,
              onPressed: _changetext),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Home Page"),
      ),
      body: _BodyWidget(),
      backgroundColor: Colors.black,
      floatingActionButton: new FloatingActionButton(
        onPressed: _changetext,
        child: new Icon(Icons.add),
      ),
    );
  }
}*/
