import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';

import 'DrawerPage.dart';


class SalesReport extends StatefulWidget{
  @override
  _SalesReportState createState()=> new _SalesReportState();

}

class _SalesReportState  extends State<SalesReport>{
  List reportItem = [
    "চাল",
    "চিনি",
    "মুড়ি",
    "দুধ",
    "বিস্কুট",
    "চাল",
    "চিনি",
    "মুড়ি",
    "দুধ",
    "বিস্কুট",
  ];
  List saleList = [
    "Abc",
    "Abdul",
    "Rahim",
    "Kalam",
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white.withOpacity(0.95),
     appBar: AppBar(
       backgroundColor: Colors.blue,
       elevation: 0,
       title: Text(" Sales Report ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
       titleSpacing: 0,
       actions: <Widget>[
       ],

     ),
     drawer: DrawerPage(),
     body: Container(
       child: Column(
         children: <Widget>[
           Container(
             padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 25),
             height: 70,
             color: todoItemDoneBgColor.withOpacity(0.2),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Container(
                   width:MediaQuery.of(context).size.width*0.45,
                   child: Text(
                       "Payment Method/Customer/Order no / Item Details "
                   ),
                 ),
                 Text("Qty"),
                 Text(
                     "Sum"
                 ),
               ],
             ),
           ),
           Expanded(
             child: ListView.builder(
               shrinkWrap: true,
               padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 30),
               itemBuilder:_getReportList,
               /*separatorBuilder: (context, index) {
                 return Container(
                   height: 1,
                   color: Colors.white.withOpacity(0.5),
                 );
               },*/
               itemCount: saleList.length,
             ),
           )
         ],
       ),
     ),
   );
  }


  Widget _getReportList(BuildContext context, int index) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                          "Cash"
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                          saleList[0]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                          "0/10/2020 12.00pm"
                      ),
                    ),
                    Container(
                      height: 250,
                      //width: 350,
                      padding: EdgeInsets.only(left: 25,top: 5,bottom: 5),
                      child:ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                          );
                        },
                        itemBuilder:_getItemList,
                        itemCount: reportItem.length,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                  "5"
              ),
              Text(
                  "2500 ৳"
              )
            ],
          ),
          //SizedBox(height: 10,),
        ),

      ),

    );
  }
  Widget _getItemList(BuildContext context, int i){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              reportItem[i]
          ),


        ],
      ),
    );
  }
}