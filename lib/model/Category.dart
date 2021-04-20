
import 'package:flutter_app/repository/database_creator.dart';

import 'ProductModel.dart';

class Category {
  int id;
  String categoryName;
  String description;
  String categoryCode;
  int itemCount;
  Category(this.id, this.categoryName, this.description, this.categoryCode, this.itemCount);

  Category.cat(this.id, this.categoryName, this.description, this.categoryCode, this.itemCount);
  Category.catItem(this.id, this.categoryName, this.description, this.categoryCode, this.itemCount);

  /*Category.fromCategory(Category cat):
        this.id = cat.id,
        this.categoryName= cat.categoryName,
        this.description= cat.description,
        this.categoryCode= cat.categoryCode,
        this.itemCount =cat.itemCount,
        this.item= cat.item;
*/
  Category.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.ID];
    this.categoryName = json[DatabaseCreator.CATEGORY_NAME];
    this.description = json[DatabaseCreator.CATEGORY_DESCRIPTION];
    this.categoryCode = json[DatabaseCreator.CATEGORY_CODE];
    this.itemCount = json[DatabaseCreator.CATEGORY_ITEM_COUNT];
  }

}
