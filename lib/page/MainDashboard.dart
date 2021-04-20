import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Color/SelectColor.dart';
import 'package:flutter_app/model/DashboardItems.dart';
import 'package:flutter_app/page/sales_panel.dart';
import 'package:flutter_app/utils/Languages.dart';
import 'package:flutter_app/utils/LocaleHelper.dart';
import 'package:flutter_app/utils/localizations.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'DrawerPage.dart';
import 'Inventory.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int selectedRatio;
  int selectedRatioTile;
  static int sharedValue = 0;
  SpecificLocalizationDelegate _specificLocalizationDelegate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRatio = 0;
    selectedRatioTile = 0;
    helper.onLocaleChanged = onLocaleChange;
    _specificLocalizationDelegate =
        SpecificLocalizationDelegate(new Locale("en"));
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _specificLocalizationDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  setSelectedRadioButtonTile(int val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      selectedRatioTile = val;
      sharedPreferences.setInt("language", this.selectedRatioTile);
      sharedValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DashboardItems> dashboardLists = dashBoardList();
    List<String> dashboardList = sharedValue == 0
        ? Languages.bl_dashboardList
        : Languages.en_dashboardList;
    List<String> imagePaths = [
      "images/inventory.png",
      "images/crm.png",
      "images/sell-product.png",
      "images/purchase.png",
      "images/employee_manage.png",
      "images/reports.png",
    ];
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            sharedValue == 0 ? Languages.bl_dashboard : Languages.en_dashboard,
            style: TextStyle(color: Colors.black),
          ),
          iconTheme:
              new IconThemeData(color: Color(SelectColor.getThemeColor())),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(
              offset: Offset(0, 55),
              elevation: 10,
              onSelected: (value) {
                print(value);
                if (value == "language") {
                  showPopup();
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: "language",
                    child: Text("Language"),
                  ),
                  PopupMenuItem(
                    value: "Website",
                    child: Text("Website"),
                  )
                ];
              },
            )
          ],
        ),
        drawer: DrawerPage(),
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
//                height: 500,
//        mainAxisSize: MainAxisSize.max,
                child: GridView.count(
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(dashboardList.length, (index) {
                    return Center(
                      child: dashboardCard(
                          dashboardList[index], imagePaths[index], index),
                    );
                  }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Expanded(
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () => goToInventory(),
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Color(SelectColor.getThemeColor()),
                        disabledTextColor: Color(SelectColor.getThemeColor()),
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: Text(
                              sharedValue == 0
                                  ? Languages.bl_inventory
                                  : Languages.en_inventory,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Expanded(
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Color(SelectColor.getThemeColor()),
                        disabledTextColor: Color(SelectColor.getThemeColor()),
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () => goToSale(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 5.0,
                          ),
                          child: Text(
                              sharedValue == 0
                                  ? Languages.bl_sale
                                  : Languages.en_sale,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  )


                ],
              )
            ],
          ),
        ));
  }

  Widget dashboardCard(String name, imagePath, int i) {
    return Container(
      width: MediaQuery.of(context).size.width,
//      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
//      color: Color(Helper.getHexToInt('FD9A18')),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
//              shape: new RoundedRectangleBorder(
//                  borderRadius: new BorderRadius.circular(30.0)),
              color: Color(SelectColor.getThemeColor()),
              borderSide: BorderSide(
                color: Color(SelectColor.getThemeColor()),
                style: BorderStyle.solid, //Style of the border
                width: 0.8,
              ),
//              highlightedBorderColor: Color(SelectColor.getThemeColor()),
//              onPressed: () => gotoNextPage(i),
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
                      height: 70.0,
                      width: 80.0,
                    ),
//                    SizedBox(
//                      height: 5.0,
//                    ),
//                    new Expanded(
//                      child:
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "৫,০০০",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
//                    ),
                  ],
                ),
              ),
              onPressed: () {
                gotoNextPage(i);
                },
            ),
          ),
        ],
      ),
    );
  }

  gotoNextPage(int i) {
    switch (i) {
      case 0:
        /*Route route = MaterialPageRoute(builder: (context) => Inventory());
        Navigator.push(context, route);*/
        break;
      case 1:
//        Route route = MaterialPageRoute(builder: (context)=>Inventory());
//        Navigator.push(context, route);
        break;
      case 2:
//        Route route = MaterialPageRoute(builder: (context)=>Inventory());
//        Navigator.push(context, route);
        break;
    }
  }

  List<DashboardItems> dashBoardList() {
    return [DashboardItems(id: 1, name: "", imagePath: "", amount: 123)];
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
                  new RadioListTile(
                    value: 0,
                    activeColor: Color(SelectColor.getThemeColor()),
                    groupValue: selectedRatioTile,
                    onChanged: (value) {
                      setSelectedRadioButtonTile(value);
                      print(value);
                      Navigator.pop(context);
                    },
                    title: Text(
                      "Bangla",
                      style: TextStyle(color: Colors.black),
                    ),
                    selected: true,
                  ),
                  new RadioListTile(
                    value: 1,
                    activeColor: Color(SelectColor.getThemeColor()),
                    groupValue: selectedRatioTile,
                    onChanged: (value) {
                      setSelectedRadioButtonTile(value);
                      print(value);
                      Navigator.pop(context);
                    },
                    title: Text("English"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  buttonShow() {
    new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              color: Color(SelectColor.getThemeColor()),
              //Colors.black,
              onPressed: () {
//                gotoDashboard();
              },
              child: new Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Expanded(
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
  goToInventory(){
    Route route = MaterialPageRoute(builder: (context) => Inventory());
    Navigator.push(context, route);
  }
  goToSale(){
    Route route = MaterialPageRoute(builder: (context) => SalesPanel());
    Navigator.push(context, route);
  }
}
