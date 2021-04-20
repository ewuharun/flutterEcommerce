import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/DummyData.dart';
import 'package:flutter_app/model/ProductModel.dart';

import 'AddProduct.dart';
import 'DrawerPage.dart';
import 'Stock.dart';


class ItemCategory extends StatefulWidget {
  @override
  _ItemCategoryState createState() =>  _ItemCategoryState() ;
}

class _ItemCategoryState extends State<ItemCategory>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Stock())
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Icon(
                  Icons.arrow_back
              ),
            ),
          )
        ],

        title: Text(" All Items ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
        titleSpacing: 0,

      ),
      drawer: DrawerPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: (){
          Route route = MaterialPageRoute(builder: (context)=>AddProduct());
          Navigator.push(context, route);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context,int index){
              return categoryItem(DummyData.getItems()[index]);
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: DummyData.getItems().length),

      ),
    );
  }

  Widget categoryItem(Product items) {
    return ListTile(
      dense: true,
      title: Text(items.productName,softWrap: true,maxLines: 1,style: TextStyle(
        fontSize: 15
      ),),
      subtitle: Text(" Price: ${items.price} ৳ /  ${items.unit} "),
      trailing: Text("Stock: ${items.price}"),
      onTap: (){

      },
    );
  }

}
