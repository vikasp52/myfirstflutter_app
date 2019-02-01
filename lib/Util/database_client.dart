import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  final String tableName  = "nodoTbl";
  final String columnId = "id";
  final String columnItemName = "itemName";
  final String columnDataCreated = "dataCreated";

  static Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb(){

  }
}