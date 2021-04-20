
import 'package:flutter_app/model/ProductModel.dart';

import 'database_creator.dart';

class RepositoryServiceTodo {
  static Future<List<Product>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.PRODUCT_TABLE}
    WHERE ${DatabaseCreator.ID} > 0''';
    final data = await db.rawQuery(sql);
    List<Product> products = List();

    for (final node in data) {
      final product = Product.fromJson(node);
      products.add(product);
    }
    return products;
  }

  static Future<Product> getTodo(int id) async {
    //final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    //WHERE ${DatabaseCreator.id} = $id''';
    //final data = await db.rawQuery(sql);

    final sql = '''SELECT * FROM ${DatabaseCreator.PRODUCT_TABLE}
    WHERE ${DatabaseCreator.ID} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final product = Product.fromJson(data.first);
    return product;
  }

  static Future<void> addTodo(Product product) async {
    /*final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.isDeleted}
    )
    VALUES 
    (
      ${todo.id},
      "${todo.name}",
      "${todo.info}",
      ${todo.isDeleted ? 1 : 0}
    )''';*/

    final sql = '''INSERT INTO ${DatabaseCreator.PRODUCT_TABLE}
    (
      ${DatabaseCreator.ID},
      ${DatabaseCreator.CAT_ID},
      ${DatabaseCreator.PRODUCT_NAME},
      ${DatabaseCreator.PRICE},
      ${DatabaseCreator.QUANTITY},
      ${DatabaseCreator.UNIT}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [product.id,product.cat_id, product.productName, product.price, product.unit];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
  }

  static Future<void> deleteTodo(Product product) async {
    /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} = ${todo.id}
    ''';*/

//    final sql = '''UPDATE ${DatabaseCreator.TABLE}
//    SET ${DatabaseCreator.isDeleted} = 1
//    WHERE ${DatabaseCreator.id} = ?
//    ''';
//
//    List<dynamic> params = [todo.id];
//    final result = await db.rawUpdate(sql, params);

//    DatabaseCreator.databaseLog('Delete todo', sql, null, result, params);
  }

  static Future<void> updateTodo(Product product) async {
    /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.name} = "${todo.name}"
    WHERE ${DatabaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.PRODUCT_TABLE}
    SET ${DatabaseCreator.PRODUCT_NAME} = ?
    WHERE ${DatabaseCreator.ID} = ?
    ''';

    List<dynamic> params = [product.productName, product.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update todo', sql, null, result, params);
  }

  static Future<int> todosCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.PRODUCT_TABLE}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
