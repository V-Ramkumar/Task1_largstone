import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task1/Database/DatabaseModel/MarketModel.dart';


class DatabaseHelper {
  static const _databaseName = "Marketbase.db";
  static const _databaseVersion = 1;

  static const table = 'leadlist';
  static const columnId = 'id';
  static const leadId = 'lead_id';
  static const customerName = 'customer_name';
  static const managedBy = 'managed_by';
  static const customerType = 'customer_type';
  static const entryDate = 'date';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database _database;
  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $leadId TEXT NOT NULL,
            $customerName TEXT NOT NULL,
            $managedBy  TEXT NOT NULL,
            $customerType TEXT NOT NULL,
            $entryDate TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(MarketModel marketModel) async {
    Database db = await instance.database;
    return await db.insert(table, marketModel.toMap());
  }

  Future<List<MarketModel>> queryAllUsers() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> list = await db.query(table);
    return list.map((u) => MarketModel.fromMap(u)).toList();
  }

}
