import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/Calcie.dart';
import 'package:myfirstflutter_app/Calculator.dart';
import 'package:myfirstflutter_app/ControllerList.dart';
import 'package:myfirstflutter_app/DataBaseExample/Configuration.dart';
import 'package:myfirstflutter_app/Dialler.dart';
import 'package:myfirstflutter_app/DynamicList.dart';
import 'package:myfirstflutter_app/ListViewExample.dart';
import 'package:myfirstflutter_app/Popup%20Dialog.dart';
import 'package:myfirstflutter_app/Quiz_App/landing_page.dart';
import 'package:myfirstflutter_app/Stepper.dart';
import 'package:myfirstflutter_app/main.dart';

class ListOfApps extends StatefulWidget {
  @override
  _ListOfAppsState createState() => _ListOfAppsState();
}

class _ListOfAppsState extends State<ListOfApps> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("List of All Apps",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,),),
      ),

      body: Padding(padding: EdgeInsets.all(15.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Age Calculator'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Instagram UI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MYAPP()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('ListView'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SampleApp()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Controller'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DialogExample()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Calculator'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Calcie()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('WhatsApp UI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiallerApp()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Stepper'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StepperApp()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Dynamic List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DemoScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Input with list'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputList()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Game'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adb),
            title: Text('Configuration'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfigurationPage()),
              );
            },
          ),
        ],
      ),),
    );
  }
}

