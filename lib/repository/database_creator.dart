import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DatabaseCreator {
  static const PRODUCT_TABLE = 'product';
  static const ID = 'id';
  static const CAT_ID = 'cat_id';
  static const PRODUCT_NAME = 'name';
  static const PRICE = 'price';
  static const QUANTITY = 'quantity';
  static const COST = '';
  static const UNIT = 'unit';
//==============================================================
  static const CATEGORY_TABLE = 'category';
  static const CATE_ID = 'id';
  static const CATEGORY_NAME = 'category_name';
  static const CATEGORY_DESCRIPTION = 'category_description';
  static const CATEGORY_CODE = 'category_code';
  static const CATEGORY_ITEM_COUNT = 'item_count';

//  List tables = [];

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult, List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createTodoTable(Database db) async {

    final todoSql = '''CREATE TABLE $PRODUCT_TABLE
    (
      $ID INTEGER PRIMARY KEY,
      $CAT_ID INTEGER,
      $PRODUCT_NAME TEXT,
      $PRICE TEXT,
      $QUANTITY TEXT,
      $UNIT TEXT,
    )''';
    await db.execute(todoSql);
    final categorySql = '''CREATE TABLE $CATEGORY_TABLE
    (
      $CATE_ID INTEGER PRIMARY KEY,
      $CATEGORY_NAME TEXT,
      $QUANTITY TEXT,
      $CATEGORY_CODE TEXT,
    )''';

    await db.execute(categorySql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('fordo');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createTodoTable(db);
  }
}
