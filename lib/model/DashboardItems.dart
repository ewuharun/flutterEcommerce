
import 'package:flutter/cupertino.dart';
class DashboardItems{
  int id;
  String name;
  String imagePath;
  int amount;

  DashboardItems({
    @required this.id,
    @required this.name,
    @required this.imagePath,
    @required this.amount,
  });

  DashboardItems.name(this.id, this.name, this.imagePath, this.amount);


}