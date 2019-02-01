import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/main.dart';

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }),
        floatingActionButton: new FloatingActionButton(
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
                                    keyboardType: TextInputType.number,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
            tooltip: "Add Controler",
            child: Icon(Icons.add)));
  }

  //Text("Controler $i"))
  Widget getRow(int i) {
    return Card(
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                child: new Text("C"),
              ),
              new Padding(padding: EdgeInsets.only(right: 10.0)),
              new Text(
                "Controler $i",
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
        ),
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => new SimpleDialog(
                  title: new Text("AUTO AQUA"), children: <Widget>[
                SimpleDialogOption(
                  child: Text("123456",
                  textAlign: TextAlign.center,),
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("MODE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => ModeOption(),
                      )
                    );
                  },
                ),
                new Divider(
                  height: 16.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("PROGRAM",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => ProgramOption(),
                        )
                    );
                  },
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("FIELD PARAMETERS",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("TIMING",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("FOGGER",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("STATUS",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("IRR STOP",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("SET CLOCK TIME",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                ),
                new Divider(
                  height: 10.0,
                  color: Colors.deepOrange,
                ),
                SimpleDialogOption(
                  child: Text("EDIT NUMBER",textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: (){
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (context) => NextPage(),
                        )
                    );
                  },
                ),
              ]));
        },
      ),
    );
  }
}

class ModeOption extends StatefulWidget {
  @override
  _ModeOptionState createState() => _ModeOptionState();
}

// Mode Class
class _ModeOptionState extends State<ModeOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mode"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                style: TextStyle(
                  fontSize: 20.0
                ),
                decoration: InputDecoration(
                  labelText: "Max Program",
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                style: TextStyle(
                    fontSize: 20.0
                ),
                decoration: InputDecoration(
                  labelText: "Max Output",
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                style: TextStyle(
                    fontSize: 20.0
                ),
                decoration: InputDecoration(
                  labelText: "Max Fogger",
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                style: TextStyle(
                    fontSize: 20.0
                ),
                decoration: InputDecoration(
                  labelText: "Max delay",
                ),
                keyboardType: TextInputType.number,
              ),
              RawMaterialButton(
                onPressed: null,
                fillColor: Colors.indigo,
                splashColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),
                shape: const StadiumBorder(),
              ),
            ],
          )
        ),
      ),
    );
  }
}

//Program Class
class ProgramOption extends StatefulWidget {
  @override
  _ProgramOptionState createState() => _ProgramOptionState();
}

class _ProgramOptionState extends State<ProgramOption> {

  // state variable
  double _result = 0.0;
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:

      break;
      case 1:
      //_result = ...
      break;
      case 2:
      //_result = ...
      break;
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Program"),
      ),
      body:
      Padding(padding: EdgeInsets.all(20.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text("Program No: 1",
          textAlign: TextAlign.center,
          style:
          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          Row(
            children: <Widget>[
              Text("Mode:",
              style: TextStyle(fontSize: 20.0),),

              new Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text("1"),
              SizedBox.fromSize(
                size: Size(20.0, 0.0),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text("2"),
              SizedBox.fromSize(
                size: Size(20.0, 0.0),
              ),
              new Radio(
                value: 2,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text("3"),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Flush Type:",
                style: TextStyle(fontSize: 20.0),),

              new Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text("Days"),
              SizedBox.fromSize(
                size: Size(20.0, 0.0),
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text("Irr-Out"),
            ],
          ),
        TextFormField(
          style: TextStyle(fontSize: 20.0,
          color: Colors.black),
          decoration: InputDecoration(
            hintText: "day",
              labelText: 'Interval'
          ),
          keyboardType: TextInputType.number,
        ),
          TextFormField(
            style: TextStyle(fontSize: 20.0,
                color: Colors.black),
            decoration: InputDecoration(
                hintText: "min",
                labelText: 'Flush On'
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: <Widget>[
              Text("Fertilizer Type:",
                style: TextStyle(fontSize: 20.0),),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text("Sequential"),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text("Together"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          TextFormField(
            style: TextStyle(fontSize: 20.0,
                color: Colors.black),
            decoration: InputDecoration(
                hintText: "min",
                labelText: 'Fertilizer Delay'
            ),
            keyboardType: TextInputType.number,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RawMaterialButton(
                onPressed: null,
                fillColor: Colors.indigo,
                splashColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0),
                  child: Text(
                    "SEND",
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),
                shape: const StadiumBorder(),
              ),
              SizedBox.fromSize(
                size: Size(10.0, 10.0),
              ),
              RawMaterialButton(
                onPressed: null,
                fillColor: Colors.indigo,
                splashColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),
                shape: const StadiumBorder(),
              ),
            ],
          ),
        ],
      )
      ),
    );
  }
}

