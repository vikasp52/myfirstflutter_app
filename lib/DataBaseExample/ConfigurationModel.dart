import 'package:flutter/material.dart';

class ConfigurationModel extends StatelessWidget {

  int _configid;
  String _configMaxProg;
  String _configMaxOutput;
  String _configMobNo;
  String _configNoOfSlave;
  String _ConfigDateCreated;


  ConfigurationModel(this._configMaxProg, this._configMaxOutput,
      this._configMobNo, this._configNoOfSlave, this._ConfigDateCreated);

  ConfigurationModel.map(dynamic obj){
    this._configid = obj["id"];
    this._configMaxProg = obj["configMaxProg"];
    this._configMaxOutput = obj["configMaxOutput"];
    this._configMobNo = obj["configMobNo"];
    this._configNoOfSlave = obj["configNoOfSlave"];
    this._ConfigDateCreated = obj["ConfigDateCreated"];
  }

  int get id => _configid;
  String get configMaxProg => _configMaxProg;
  String get configMaxOutput => _configMaxOutput;
  String get configMobNo => _configMobNo;
  String get configNoOfSlave => _configNoOfSlave;
  String get ConfigDateCreated => _ConfigDateCreated;

  Map<String, dynamic> toMap1(){
    var map = new Map<String, dynamic>();
    map["configMaxProg"] = _configMaxProg;
    map["configMaxOutput"] = _configMaxOutput;
    map["configMobNo"] = _configMobNo;
    map["configNoOfSlave"] = _configNoOfSlave;
    map["ConfigDateCreated"] = _ConfigDateCreated;

    if(_configid != null){
      map["id"] = _configid;
    }

    return map;
  }

  ConfigurationModel.fromMap(Map<String, dynamic> map){
    this._configid = map["id"];
    this._configMaxProg = map["configMaxProg"];
    this._configMaxOutput = map["configMaxOutput"];
    this._configMobNo = map["configMobNo"];
    this._configNoOfSlave = map["configNoOfSlave"];
    this._ConfigDateCreated = map["ConfigDateCreated"];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
