import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/DummyData.dart';
import 'package:flutter_app/model/Category.dart';

import 'CreateCategory.dart';
import 'DrawerPage.dart';


class ProductCategory extends StatefulWidget {
  @override
  _ProductCategoryState createState() =>  _ProductCategoryState() ;
}

class _ProductCategoryState extends State<ProductCategory>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        /*leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white),
        ),*/

        title: Text(" All Category ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
        titleSpacing: 0,
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Icon(
                  Icons.arrow_back
              ),
            ),
          )
        ],
      ),
      drawer: DrawerPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: (){
          Navigator.pop(context);
          Route route = MaterialPageRoute(builder: (context)=>CreateCategory());
          Navigator.push(context, route);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context,int index){
              return categoryItem(DummyData.getCategories()[index]);
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: DummyData.getCategories().length),

      ),
    );
  }

  Widget categoryItem(Category categori) {
    return ListTile(
      dense: true,
      title: Text(categori.categoryName,softWrap: true,maxLines: 1,style: TextStyle(
        fontSize: 15
      ),),
      subtitle: Text(categori.itemCount > 1 ? "${categori.itemCount} items" : "${categori.itemCount} item"),
      onTap: (){

      },
    );
  }

}
