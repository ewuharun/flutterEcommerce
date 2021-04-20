import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';

import 'DrawerPage.dart';


class OrderUpdate extends StatefulWidget{
  @override
  _OrderUpdateState createState() => _OrderUpdateState();

}

class _OrderUpdateState extends State<OrderUpdate>{

  List orderList = [
    "01",
    "02",
    "03",
    "04"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(" Order update ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
        titleSpacing: 0,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white),
          ),
        ],

      ),
      drawer: DrawerPage(),
      body: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                /*separatorBuilder: (context, index) {
                          return Container(
                            height: 1,
                            color: Colors.white.withOpacity(0.5),
                          );
                        },*/
                itemBuilder:_getItemList,
                itemCount: orderList.length,
              ),
            ),
          )
        ],
      ),

    );
  }
  Widget _getItemList(BuildContext context, int i){
    return Card(
      child:  Container(
        //color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //width: MediaQuery.of(context).size.width*0.2,
                    child: Text(
                        "Order no :",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width*0.4,
                    child: Text(
                        orderList[i]
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    //width: MediaQuery.of(context).size.width*0.2,
                    child: Text(
                        "Order status :",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width*0.4,
                    child: Text(
                        "Pending",style: TextStyle(color: red,fontFamily: rubikFontBold)
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      )

    );


  }
}