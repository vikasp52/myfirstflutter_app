import 'package:flutter/material.dart';
import 'package:myfirstflutter_app/DataBaseExample/DataBase_Client.dart';
import 'package:myfirstflutter_app/DataBaseExample/ConfigurationModel.dart';


//var etMaxProgram = TextEditingController();
class ConfigurationPage extends StatefulWidget {
  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final _MaxProgController = TextEditingController();
  final _MaxOutputController = TextEditingController();
  final _MobNoController = TextEditingController();
  final _NoOfSlavesController = TextEditingController();

  var db = new DataBaseHelper();

  void _handleSubmitted1(String maxProg, String MaxOut, String mobNo, String noofslaves ) async {
    _MaxProgController.clear();
    _MaxOutputController.clear();
    _NoOfSlavesController.clear();
    _MobNoController.clear();

    //int ContID = int.parse(db.columnId);

    ConfigurationModel doItems1 = new ConfigurationModel(maxProg,MaxOut,mobNo,noofslaves,DateTime.now().toIso8601String());
    int saveItemId = await db.saveConfigurationItem(doItems1);

//    ConfigurationModel addedItems = await db.getItem(saveItemId);

    /*setState(() {
      _itemList.add(addedItems);
    });*/
  }

  @override
  Widget build(BuildContext context) {

    /* var d= 0;
    if(myController.text != null){

      var d= int.parse(myController.text);//the number of text fields
      var textFields = <TextField>[];
      var textEditingControllers = <TextEditingController>[];
      var list = new List<int>.generate(d, (i) =>i + 1 );
      list.forEach((i) {
        var textEditingController = new TextEditingController();
        textEditingControllers.add(textEditingController);
        return textFields.add(new TextField(controller: textEditingController,decoration:
        InputDecoration(
          hintText: "Enter the mobile no.",
          labelText: "Slave $i",
        ),
          keyboardType: TextInputType.number,
        )
        );
      });

    }*/
    var d= 0;
    createTexttextfields (int d){

      if (_NoOfSlavesController.text != null) {
        var textEditingControllers = <TextEditingController>[];
        var textFields = <TextField>[];
        var list = new List<int>.generate(d, (i) =>i + 1 );
        print(list);

        list.forEach((i) {
          var textEditingController = new TextEditingController();
          textEditingControllers.add(textEditingController);
          return textFields.add(new TextField(controller: textEditingController,decoration:
          InputDecoration(
              labelText: "Slave $i",
              hintText: "Enter the mobile no."
          ),
            keyboardType: TextInputType.number,
          ));
        });
        return textFields;
      }else{
        return 0;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Configuration"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              //controller: _textEditingControler,
              decoration: InputDecoration(
                labelText: "Max Program",
                //hintText: "Enter the no. of program"
              ),
              keyboardType: TextInputType.number,
              controller: _MaxProgController,
              onEditingComplete: (){
                var s = _MaxProgController.text;
              },
            ),
            TextFormField(
              controller: _MaxOutputController,
              decoration: InputDecoration(
                labelText: "Max Output",
                //hintText: "Enter the no. of output"
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _MobNoController,
              decoration: InputDecoration(
                labelText: "Mobile No.",
                //hintText: "Enter the no. of output"
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _NoOfSlavesController,
              decoration: InputDecoration(
                labelText: "No. of slaves",
                //hintText: "Enter the no. of output"
              ),
              onChanged: (str){
                setState(() {
                  str = _NoOfSlavesController.text;
                });
              },
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Slaves"),
            ),
            Expanded( child: Container(
              color: Colors.lightBlueAccent.withOpacity(0.2),
              child: ListView.builder(
                itemCount: d.toString().length,
                itemBuilder: (context, i) => new Column(
                  children: _NoOfSlavesController.text.length != null
                      ?
                  createTexttextfields(_NoOfSlavesController.text.length):
                  createTexttextfields(int.parse(_NoOfSlavesController.text)),
                ),
              ),
            ),
            ),
            MaterialButton(onPressed: (){

              _handleSubmitted1(_MaxProgController.text, _MaxOutputController.text, _MobNoController.text, _NoOfSlavesController.text);
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgramPage()),
              );*/
            },
              child: Text("Save & Next"),
              color: Colors.lightBlue,
            )
          ],
        ),
      ),
      //bottomNavigationBar: BttomNav(),
    );
  }

}
