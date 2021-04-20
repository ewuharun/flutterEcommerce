import 'package:flutter_app/model/Category.dart';

import 'database_creator.dart';


class RepositoryServiceCategory {
  static Future<List<Category>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.CATEGORY_TABLE}
    WHERE ${DatabaseCreator.ID} > 0''';
    final data = await db.rawQuery(sql);
    List<Category> categories = List();

    for (final node in data) {
      final category = Category.fromJson(node);
      categories.add(category);
    }
    return categories;
  }

  static Future<Category> getTodo(int id) async {
    //final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    //WHERE ${DatabaseCreator.id} = $id''';
    //final data = await db.rawQuery(sql);

    final sql = '''SELECT * FROM ${DatabaseCreator.CATEGORY_TABLE}
    WHERE ${DatabaseCreator.ID} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final category = Category.fromJson(data.first);
    return category;
  }

  static Future<void> addTodo(Category category) async {
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

    final sql = '''INSERT INTO ${DatabaseCreator.CATEGORY_TABLE}
    (
      ${DatabaseCreator.ID},
      ${DatabaseCreator.CATEGORY_NAME},
      ${DatabaseCreator.QUANTITY},
      ${DatabaseCreator.CATEGORY_CODE}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [category.id, category.categoryName, category.description, category.categoryCode];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
  }

  static Future<void> deleteTodo(Category category) async {
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

  static Future<void> updateTodo(Category category) async {
    /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.name} = "${todo.name}"
    WHERE ${DatabaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.CATEGORY_TABLE}
    SET ${DatabaseCreator.CATEGORY_NAME} = ?
    WHERE ${DatabaseCreator.ID} = ?
    ''';

    List<dynamic> params = [category.categoryName, category.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update todo', sql, null, result, params);
  }

  static Future<int> todosCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.CATEGORY_TABLE}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
