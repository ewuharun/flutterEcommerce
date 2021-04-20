import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';

import 'DrawerPage.dart';


class StockReport extends StatefulWidget{
  @override
  _StockReportState createState()=> new _StockReportState();

}

class _StockReportState  extends State<StockReport>{
  List reportItem =[
  "চাল",
  "চিনি",
  "মুড়ি",
  "দুধ",
  "বিস্কুট",
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white.withOpacity(0.95),
     appBar: AppBar(
       backgroundColor: Colors.blue,
       elevation: 0,
       title: Text("Stock Report ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
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
     bottomNavigationBar: BottomAppBar(
       color: Colors.blue,
       elevation: 1,
       child:Container(
         height: 40,
         child: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             Container(
               //width:MediaQuery.of(context).size.width*0.7,
               child: Text(
                 "Total",style: TextStyle(
                 fontSize: 12,fontFamily: rubikFontBold,color: Colors.white,
               ),
               ),
               padding: EdgeInsets.only(left: 15),
             ),
             Container(
               //padding: EdgeInsets.only(left: 60),
               //width: MediaQuery.of(context).size.width*0.45,
               child: Text(" ৳ 30000",textAlign: TextAlign.right,style: TextStyle(
                 fontSize: 12,fontFamily: rubikFont,color: Colors.white,
               ),),
             ),
             Container(
               //width: MediaQuery.of(context).size.width*0.15,
               //padding: EdgeInsets.only(right: 15),
               child: Text("500 qty",textAlign: TextAlign.right,style: TextStyle(
                 fontSize: 12,fontFamily: rubikFont,color: Colors.white,
               ),),
             ),
             Container(
               //width: MediaQuery.of(context).size.width*0.15,
               //padding: EdgeInsets.only(right: 15),
               child: Text("100 qty",textAlign: TextAlign.right,style: TextStyle(
                 fontSize: 12,fontFamily: rubikFont,color: Colors.white,
               ),),
             ),
             Container(
               //width: MediaQuery.of(context).size.width*0.15,
               //padding: EdgeInsets.only(right: 15),
               child: Text("300000 ৳",textAlign: TextAlign.right,style: TextStyle(
                 fontSize: 12,fontFamily: rubikFont,color: Colors.white,
               ),),
             )
           ],
         ),
       )


     ),
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
                   "Items "
                 ),
                 Text("Price"),
                 Text(
                   "Qty"
                 ),
                 Text(
                   "Consumed qty"
                 ),
                 Text(
                   "Total tk"
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
                          Text("60 "),
                          Text("৳ 500 "),
                          Text(" 100 "),
                          Text("৳ 3000"),
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