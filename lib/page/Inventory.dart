import 'package:flutter/material.dart';
import 'package:flutter_app/Color/SelectColor.dart';


import 'DrawerPage.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "মালামাল",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: new IconThemeData(color: Color(SelectColor.getThemeColor())),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        drawer: DrawerPage(),
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              dashboardCard("Add Prduct", "images/add-product.png"),
              dashboardCard("Manage Inventory", "images/analytics_inventory.png"),
              dashboardCard("Analytics Inventory", "images/inventory_manage.png")
            ],
          ),
        ));
  }

  Widget dashboardCard(String name, imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
//      color: Color(Helper.getHexToInt('FD9A18')),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 150.0,
            height: 150.0,
            child: OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Color(SelectColor.getThemeColor()),
              borderSide: BorderSide(
                color: Color(SelectColor.getThemeColor()),
                style: BorderStyle.solid, //Style of the border
                width: 0.8,
              ),
              highlightedBorderColor: Colors.black,
              onPressed: () => goToAction(name),
              child: new Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10.0,
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      imagePath,
                      color: Color(SelectColor.getThemeColor()),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    new Expanded(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  goToAction(String menuName){
    switch(menuName){
      case 'Add Prduct':
          showPopup();
        break;
      case 'Manage Inventory':
        break;
      case'Analytics Inventory':
        break;
    }
  }
  showPopup() {
    final _formKey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Color(SelectColor.getThemeColor()),

                        onPressed: (){
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            gotoAddProduct();
                          }
                        },
                        child: Text("Add Product"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Color(SelectColor.getThemeColor()),

                        onPressed: (){
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                        },
                        child: Text("Add Product by Scanner"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Color(SelectColor.getThemeColor()),

                        onPressed: (){
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                          }
                        },
                        child: Text("Upload Product Bulk"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  gotoAddProduct(){
    // Route route = MaterialPageRoute(builder: (context)=>CategoryList());
    // Navigator.push(context, route);
  }
}
