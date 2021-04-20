import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Color/SelectColor.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_app/model/ProductModel.dart';
import 'package:flutter_app/repository/repository_service_product.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'DrawerPage.dart';
import 'image_picker_handler.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => new _AddProductState();
}

class _AddProductState extends State<AddProduct>
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Add Product",style: TextStyle(color: Colors.white),
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
                  new GestureDetector(
                    onTap: () => imagePicker.showDialog(context),
                    child: new Center(
                      child: _image == null
                          ? Center(
                              child: new CircleAvatar(
                                radius: 60.0,
                                backgroundColor: Colors.grey.withOpacity(0.3),
                                child:
                                    new Image.asset("images/photo_camera.png"),
                              ),
                            )
                          : new Container(
                              height: 140.0,
                              width: 140.0,
                              decoration: new BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: new DecorationImage(
                                  image: new ExactAssetImage(_image.path),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                    color: Color(SelectColor.getThemeColor()),
                                    width: 2.0),
                                borderRadius: new BorderRadius.all(
                                    const Radius.circular(80.0)),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:  EdgeInsets.only(left:20,right: 20,top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
//                    maxLength: 11,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Color(SelectColor.getTextColors(),),fontSize: 17),
                          labelText: "Product Name"),
                      validator: (value) {
                        if (value.length == 0)
                          return ("Product name is required");
                      },
                      onSaved: (value) {
                        name = value;
                      },
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.only(left:20,right: 20,),
                    child: TextFormField(
                      style: TextStyle(color: Colors.grey),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
//                    maxLength: 11,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Color(SelectColor.getTextColors()),fontSize: 17),
                          labelText: "Price"),
                          validator: (value) {
                            if (value.length == 0) return ("price is required");
                              },
                          onSaved: (value) {
                          price = value;
                      },
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 50,
                    margin:  EdgeInsets.only(left:20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          margin:  EdgeInsets.only(left:10,right: 50),
                          child: Text(
                            "Details",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17.0,fontFamily: rubikFontBold),
                            maxLines: 1,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                        ),
                        new GestureDetector(
                          onTap: () {
                            _changeState();
                          },
                          child: new Container(
                              margin: const EdgeInsets.all(0.0),
                              child: new Icon(
                                checkState == false
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                size: 30.0,
                              )),
                        ),
                      ],
                    ),
                  ),
                  checkState? Column(
                    children: <Widget>[
                      Container(
                        padding:  EdgeInsets.only(left:50,right: 10,),
                        child: TextFormField(
                          style: TextStyle(color: Color(SelectColor.getThemeColor())),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
//                    maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Color(SelectColor.getTextColors()),fontSize: 17),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(SelectColor.getThemeColor())),
                              ),
                              labelText: "Description"),
                          validator: (value) {
                            if (value.length == 0)
                              return ("Description is required");
                          },
                          onSaved: (value) {
                            quantity = value.toString() as int;
                          },
                        ),
                      ),
                      Container(
                        padding:  EdgeInsets.only(left:50,right: 10,),
                        child:
                        TextFormField(
                          style: TextStyle(color: Color(SelectColor.getThemeColor())),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
//                    maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Color(SelectColor.getTextColors()),fontSize: 17),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(SelectColor.getThemeColor())),
                              ),
                              labelText: "Quantity / Stock "),
                          validator: (value) {
                            if (value.length == 0)
                              return ("Quantity is required");
                          },
                          onSaved: (value) {
                            catId = value.toString() as int ;
                          },
                        ),
                      ),
                      Container(
                        padding:  EdgeInsets.only(left:50,right: 10,),
                        child: TextFormField(
                          style: TextStyle(color: Color(SelectColor.getThemeColor())),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
//                    maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Color(SelectColor.getTextColors()),fontSize: 17),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(SelectColor.getThemeColor())),
                              ),
                              labelText: "Cost"),
                          validator: (value) {
                            if (value.length == 0)
                              return ("Cost is required");
                          },
                          onSaved: (value) {},
                        ),
                      ),Container(
                        padding:  EdgeInsets.only(left:50,right: 10,),
                        child: TextFormField(
                          style: TextStyle(color: Color(SelectColor.getThemeColor())),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
//                    maxLength: 11,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelStyle: TextStyle(color: Color(SelectColor.getTextColors()),fontSize: 17),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(SelectColor.getThemeColor())),
                              ),
                              labelText: "Unit"),
                          validator: (value) {
                            if (value.length == 0)
                              return ("Unit is required");
                          },
                          onSaved: (value) {
                            unit = value;
                          },
                        ),
                      ),
                    ],
                  ):Container(),
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
