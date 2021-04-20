

import 'package:flutter_app/repository/database_creator.dart';

class Product {
  int id;
  int cat_id;
  String productName;
  String price;
  String unit;

  Product(this.id,this.cat_id, this.productName, this.price, this.unit);

  Product.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.ID];
    this.cat_id = json[DatabaseCreator.ID];
    this.productName = json[DatabaseCreator.PRODUCT_NAME];
    this.price = json[DatabaseCreator.PRICE];
    this.unit = json[DatabaseCreator.UNIT];
  }
}
