import 'dart:io';
import 'package:myfirstflutter_app/DataBaseExample/ConfigurationModel.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{

  static final DataBaseHelper _instance = new DataBaseHelper.internal();
  factory DataBaseHelper() => _instance;

  final String tableConfigName = "ConfigurationTabe";
  final String configId = "id";
  final String configMaxProg = "configMaxProg";
  final String configMaxOut = "configMaxOutput";
  final String configMobNo = "configMobNo";
  final String configSlaveNo = "configNoOfSlave";
  final String ConfigDateCreated = "ConfigDateCreated";

  static Database _db;

  Future<Database> get db async{
    if(_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DataBaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "AutoAquaTest.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async{
    await db.execute('CREATE TABLE $tableConfigName(id INTEGER PRIMARY KEY AUTOINCREMENT,$configMaxProg TEXT,$configMaxOut TEXT,$configMobNo TEXT,$configSlaveNo TEXT,$ConfigDateCreated TEXT)');
    print("Table is created for Config");
  }

  /* """CREATE TABLE ConfigurationTabe(
        Config_id INTEGER PRIMARY KEY,
        Controller_id INTEGER NOT NULL,
        Max_Prog INTEGER,
        Max_Output INTEGER,
        Mob_No INTEGER,
        No_of_Slaves INTEGER,
        $columnDateCreated TEXT,
        FOREIGN KEY (Controller_id) REFERENCES $tableName (id)
                ON DELETE NO ACTION ON UPDATE NO ACTION
        )"""*/

  // Insertion

  // Insertion into Configuration
  Future<int> saveConfigurationItem(ConfigurationModel item1) async{
    var dbClient1 = await db;
    int res = await dbClient1.insert("$tableConfigName", item1.toMap1());
    return res;
  }


  //Get
  Future<List> getConfigItems() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM ConfigurationTabe");
    print(result);
    return result.toList();
  }

/*//Get
  Future<List> getItems() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName");
    return result.toList();
  }

  //Get
  Future<List> getConfigItems() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM ConfigurationTable");
    return result.toList();

    print(result);
  }

//Get Count

  Future<int> getCount(int id) async{
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  Future<ControllerItem> getItem(int id) async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if(result.length == 0) return null;
    return new ControllerItem.fromMap(result.first);
  }

  //Delete Items
  Future<int> deleteItems(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tableName,
        where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateItems(ControllerItem item) async{
    var dbClient = await db;
    return await dbClient.update("$tableName", item.toMap(),
        where: "$columnId = ?", whereArgs: [item.id]);
  }*/

  Future close() async{
    var dbClient = await db;
    return dbClient.close();
  }

}