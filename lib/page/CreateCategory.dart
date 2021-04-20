import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Color/SelectColor.dart';
import 'package:flutter_app/constant/ThemeColor.dart';

import 'DrawerPage.dart';
import 'ProductCategory.dart';

class CreateCategory extends StatefulWidget {
  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  String category_name;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text("Create Category", style: TextStyle(color: Colors.white,fontFamily: rubikFontBold),),
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
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:20,right: 50,top: 50),
            child: TextFormField(
              style: TextStyle(color: Color(SelectColor.getTextColors())),
              //cursorColor: Colors.black,
              keyboardType: TextInputType.text,
//                    maxLength: 11,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black,fontSize: 17,fontFamily: rubikFont),
                  counterStyle: TextStyle(fontSize: 12,color: Colors.black12),
                  errorText: "Category Name required",
                  labelText: "Category Name",
              ),
              validator: (value){
                if(value.length==0)
                  return("Name required");
              },
              onChanged:(value) {
                this.category_name = value;

              },
              onSaved:(value){
              },
            ),

          ),
          /*Container(
            margin: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),

            child: TextFormField(
              style: TextStyle(color: Color(SelectColor.getThemeColor())),
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
//                    maxLength: 11,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(SelectColor.getThemeColor())),
                  ),
                  labelText: "Description"
              ),
              validator: (value){
                if(value.length==0)return("Description required");
              },
              onSaved:(value){
              },
            ),

          ),
          Container(
            margin: EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 10),

            child: TextFormField(
              style: TextStyle(color: Color(SelectColor.getThemeColor())),
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,

//                    maxLength: 11,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(SelectColor.getThemeColor())),
                  ),
                  labelText: "Code"
              ),
              validator: (value){
                if(value.length==0)return("Address required");
              },
              onSaved:(value){
              },
            ),

          ),*/

          SizedBox(
            height: 40,
          ),
          Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 20,right: 20,top: 90,bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Text("Create",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 17),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ProductCategory())
                        );

                      },
                      child: Ink(
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.white,
                          child:Icon(
                            Icons.chevron_right,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              )


          )
        ],
      ),
    );
  }
}
