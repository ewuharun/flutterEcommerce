import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'Feedback.dart';
import 'InventoryDetails.dart';
import 'NewDashboard.dart';
import 'OrderNotification.dart';
import 'ReportByDiscount.dart';
import 'ReportByOrderSale.dart';
import 'ReportByPaymentType.dart';

import 'SalesReport.dart';
import 'StockReport.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var facebookLogin = FacebookLogin();

  List<String> reportItemList= [
    "By payment types ",
    "By orders",
    "By Discounts",
    "Sales report",
    "Stock report"
  ];

  String backgroundImage = "https://images.unsplash.com/photo-1553095066-5014bc7b7f2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.blue,
              ),
              //Image(image: CachedNetworkImageProvider(backgroundImage)),
              CachedNetworkImage(imageUrl: backgroundImage,
              fit: BoxFit.fill,
                height: 130,
                width: MediaQuery.of(context).size.width,),
              Positioned(
                left: 20,
                bottom: 45,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Center(
//                      height: 150, width: 150,
//                    padding: EdgeInsets.only(left: 15),
                      child:Image.asset("images/profile.png",fit: BoxFit.cover,scale: 15,)
                  ),

                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Text("abc@gmail.com", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: SvgPicture.asset("assets/images/house.svg",width: 24,height: 24,),
            title: Text("Home"),
            onTap: (){
              Route route = MaterialPageRoute(builder: (context)=>NewDashboard());
              Navigator.push(context, route);
            },
          ),
          SizedBox(height: 10,),
          _getReportUI(),
          SizedBox(height: 10,),
          ListTile(
            leading: SvgPicture.asset("assets/images/sales.svg",width: 24,height: 24,),
            title: Text("Sales"),
            onTap: (){
              Route route = MaterialPageRoute(builder: (context) => null);
              Navigator.push(context, route);
            },

          ),
          SizedBox(height: 10,),
          ListTile(
            leading: SvgPicture.asset("assets/images/order.svg",height: 24,width: 24,),
            title: Text("Order notification"),
            onTap: (){
              Route route = MaterialPageRoute(builder: (context) => OrderNotification());
              Navigator.push(context, route);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: SvgPicture.asset("assets/images/bag.svg",height: 24,width: 24),
            title: Text("Inventory"),
            onTap: (){
              Route route = MaterialPageRoute(builder: (context) => InventoryDetails());
              Navigator.push(context, route);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading:Icon(
              Icons.collections_bookmark,color: Colors.blue,
            ),
            /*SvgPicture.asset("assets/images/money.svg",height: 24,width: 24),*/
            title: Text("Feedback"),
            onTap: (){
              Route route = MaterialPageRoute(builder: (context) => CustomerFeedback());
              Navigator.push(context, route);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            leading:Image.asset("assets/images/logout.png",height: 24,width: 24),
            title: Text("Logout"),
            onTap: (){
              facebookLogin.logOut();
              _googleSignIn.signOut();
              _auth.signOut();
              Navigator.pop(context);
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),

        ],
      ),
    );
  }

  Widget _getReportUI(){
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Container(
      //padding: EdgeInsets.only(left: 10),
        child: Theme(
          data: theme,
          child: ExpansionTile(
            title: Text("Reports ",
              style: TextStyle(color: Colors.black),
            ),
            leading: SvgPicture.asset("assets/images/reports.svg",height: 24,width: 24,),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context,index){
                    return _getReportItem(context,index);
                  },
                  separatorBuilder: (context, subCatIndex) => Divider(
                    color: Colors.white,
                    height: 0,
                  ),
                  itemCount: reportItemList.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _getReportItem(BuildContext context , int index){
    return Container(
        child: Align(
          alignment: Alignment.center,
          child: ListTile(
            title:  Text(" ${reportItemList[index]}",textAlign: TextAlign.left,),
            onTap: (){
              gotoNextPage(index);

            },
          ),
        )
      );
  }
  gotoNextPage(int i) {
    switch (i) {
      case 0:
      Route route = MaterialPageRoute(builder: (context) => ReportByPaymentType());
        Navigator.push(context, route);
        break;
      case 1:
        Route route = MaterialPageRoute(builder: (context) => ReportByOrderSale());
        Navigator.push(context, route);
        break;
      case 2:
        Route route = MaterialPageRoute(builder: (context) => ReportByDiscount());
        Navigator.push(context, route);
        break;
      case 3:
        Route route = MaterialPageRoute(builder: (context) => SalesReport());
        Navigator.push(context, route);
        break;
      case 4:
        Route route = MaterialPageRoute(builder: (context) => StockReport());
        Navigator.push(context, route);
      break;
    }
  }
}
