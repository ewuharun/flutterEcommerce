import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';

import 'DrawerPage.dart';


class ReportByOrderSale extends StatefulWidget{
  @override
  _ReportByOrderSaleState createState()=> new _ReportByOrderSaleState();

}

class _ReportByOrderSaleState  extends State<ReportByOrderSale>{
  List reportItem = [
    "20/09/2020",
    "30/09/2020",
    "05/09/2020",
    "20/09/2020",
    "30/09/2020",
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white.withOpacity(0.95),
     appBar: AppBar(
       backgroundColor: Colors.blue,
       elevation: 0,
       title: Text(" Report by order/sale ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
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
     body: Container(
       child: Column(
         children: <Widget>[
           Container(
             height: 40,
             color: todoItemDoneBgColor.withOpacity(0.2),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Text(
                   "Date & time "
                 ),
                 Text("Order/ Sale No."),
                 Text(
                   "Customer name"
                 ),
                 Text(
                   "Sum"
                 )
               ],
             ),
           ),
           Expanded(
             child: ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               itemBuilder:_getReportList,
               /*separatorBuilder: (context, index) {
                 return Container(
                   height: 1,
                   color: Colors.white.withOpacity(0.5),
                 );
               },*/
               itemCount: reportItem.length,
             ),
           )

         ],
       )
       ,
     ),

   );
  }


  Widget _getReportList(BuildContext context, int index) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 10,left: 0,right: 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(reportItem[index]),
                          Text(" order no - 011 "),
                          Text(" Abc "),
                          Text("??? 500"),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                )
              ],
            )



          ],
        ),
      ),

    );
  }
}