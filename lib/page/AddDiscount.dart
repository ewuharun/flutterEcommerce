import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Color/Helper.dart';
import 'package:flutter_app/Color/SelectColor.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_app/model/ProductModel.dart';
import 'package:flutter_app/repository/repository_service_product.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'DrawerPage.dart';
import 'image_picker_handler.dart';

class AddDiscount extends StatefulWidget {
  @override
  _AddDiscountState createState() => new _AddDiscountState();
}

class _AddDiscountState extends State<AddDiscount>
    with TickerProviderStateMixin, ImagePickerListener {
  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;

  final _formKey = GlobalKey<FormState>();
  Future<List<Product>> future;
  String name;
  int catId;
  String price;
  int quantity;
  String unit;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    imagePicker = new ImagePickerHandler(this, _controller);
    imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool checkState = false;
  void _changeState(){
    setState(() {
      checkState==true?checkState=false:checkState=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Add Discount",style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
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
        backgroundColor: Color(
          Helper.getHexToInt('#f1f2f6'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
//        children: <Widget>[
//        Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:  EdgeInsets.only(left:30,right: 30,top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
//                    maxLength: 11,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: false,
                          labelStyle: TextStyle(color: Color(SelectColor.getTextColors(),),fontSize: 16),
                          labelText: "Discount Name"),
                      validator: (value) {
                        if (value.length == 0)
                          return ("Discount name is required");
                      },
                      onSaved: (value) {
                        name = value;
                      },
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.only(left:30,right: 30,),
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
//                    maxLength: 11,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: false,
                          labelStyle: TextStyle(color: Color(SelectColor.getTextColors()),fontSize: 16),
                          labelText: "Discount value"),
                          validator: (value) {
                            if (value.length == 0) return ("Value is required");
                              },
                          onSaved: (value) {
                          price = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Color(SelectColor.getThemeColor()),
                    child: Text("Save",style: TextStyle(
                      fontSize: 18,fontFamily: rubikFontBold,color: Colors.white
                    ),),
//                child: CameraPage(),
                    onPressed: () {
                      createTodo();
                    },
                  ),
                )
              ],
            )
          ],
        )
    );
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
  void createTodo() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await RepositoryServiceTodo.todosCount();
      final product = Product(count,catId, name, price,unit);
      await RepositoryServiceTodo.addTodo(product);
//      setState(() {
//        id = product.id;
//        future = RepositoryServiceTodo.getAllTodos();
//      });
      print(product.id);
    }
  }

  gotoGoogle(String test) {
    Fluttertoast.showToast(
        msg: "Google "+test.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 10.0);
  }
}
