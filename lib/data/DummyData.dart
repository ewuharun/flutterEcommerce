import 'package:flutter_app/model/Category.dart';
import 'package:flutter_app/model/DiscountModel.dart';
import 'package:flutter_app/model/ProductModel.dart';

class  DummyData {

  static List<Category> getCategories(){
    List<Category> categories = [];
    categories.add(Category(1,"Chal","trujytit","cat1",2));
    categories.add(Category(2,"Dal","trujytit","cat1",1));
    categories.add(Category(3,"icecream","trujytit","cat1",1));
    return categories;
  }

  static List<Product> getItems(){
    List<Product> items = [];
    items.add(Product(1,1,"Chinigura chal","110","5 kg"));
    items.add(Product(2,1,"Miniket chal","60","9 kg"));
    items.add(Product(3,2,"moshur dal","110","9 kg"));
    items.add(Product(3,2,"khesari dal","110","8 kg"));
    items.add(Product(4,3,"igloo","60","7 kg"));
    items.add(Product(5,3,"chokobar","35","6 kg"));
    items.add(Product(4,3,"igloo","60","5 kg"));
    items.add(Product(5,3,"chokobar","35"," 4 kg"));
    items.add(Product(4,3,"igloo","60","3 kg"));
    items.add(Product(5,3,"chokobar","35","2 kg"));
    return items;
  }

  static List<DiscountModel> getDiscounts(){
    List<DiscountModel> discounts = [];
    discounts.add(DiscountModel(1," 10 % discount",".10"));
    return discounts;
  }

}