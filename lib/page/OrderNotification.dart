import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';


class OrderNotification extends StatefulWidget{
  @override
  _OrderNotificationState createState()=> new _OrderNotificationState();

}

class _OrderNotificationState  extends State<OrderNotification>{
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

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white.withOpacity(0.95),
     bottomNavigationBar: BottomAppBar(
       color: Colors.white.withOpacity(0.1),
       notchMargin: 0,
       elevation: 0,
       child: Row(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           Container(
             height: 40,
             alignment: Alignment.center,
             color:green,
             width:MediaQuery.of(context).size.width*0.4,
             child: InkWell(
               onTap: (){

               },
               child: Text(
                 "Accept",textAlign: TextAlign.center,style: TextStyle(
                 fontSize: 18,fontFamily: rubikFontBold,color: Colors.white,
               ),
               )
               ,
             )
           ),
           Container(
             height: 40,
                alignment: Alignment.center,
                color:red,
               //padding: EdgeInsets.only(left: 60),
               width: MediaQuery.of(context).size.width*0.4,
               child: InkWell(
                 onTap: (){

                 },
                 child: Text("Decline",textAlign: TextAlign.center,style: TextStyle(
                   fontSize: 18,fontFamily: rubikFontBold,color: Colors.white,
                 ),),
               )
             ),
         ],
       ),
     ),
     body: Container(
       alignment: Alignment.center,
       padding: EdgeInsets.only(top: 65,left: 30,right: 30),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Text(" Order Notification ",style: TextStyle(color: appbarTabSelectedTextColor,fontFamily: 'RubikBold',fontWeight: FontWeight.bold,fontSize: 20),),
           Container(
             padding: EdgeInsets.only(top: 15,left: 30,right: 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Container(
                   child: Text("Order no : ",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),

                 ),
                 Container(
                   child: Text("01",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),
                 )
               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 15,left: 30,right: 30),
             child: Container(
                 alignment: Alignment.centerLeft,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Container(
                     child: Text("Order details",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),
                   ),
                   Container(
                     padding: EdgeInsets.only(top: 15),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                         Text(
                             "04/10/2020",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)
                         ),
                         Text(
                             "10.20 am",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)
                         )
                       ],
                     ),
                   )
                 ],
               )
              ),
           ),
           Container(
             padding: EdgeInsets.only(top: 15,left: 30,right: 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Container(
                   child: Text("Customer name : ",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),

                 ),
                 Container(
                   child: Text("Abc",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),
                 )
               ],
             ),
           ),
           Container(
             alignment: Alignment.centerLeft,
             padding: EdgeInsets.only(top: 15,left: 60,bottom:5),
             child: Container(
                   child: Text("Products : ",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),
             ),
           ),
           Container(
             height: 260,
             padding: EdgeInsets.only(left: 47),
             width: MediaQuery.of(context).size.width*0.8,
             child:ListView.builder(
               shrinkWrap: true,
               /*separatorBuilder: (context, index) {
                          return Container(
                            height: 1,
                            color: Colors.white.withOpacity(0.5),
                          );
                        },*/
               itemBuilder:_getItemList,
               itemCount: reportItem.length,
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 15,left: 30,right: 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Container(
                   child: Text("Payment Type : ",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),

                 ),
                 Container(
                   child: Text("Cash",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),
                 ),


               ],
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 15,left: 50,right: 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Container(
                   child: Text("Delivery time : ",style: TextStyle(color: darkBlue,fontFamily: rubikFontBold)),

                 ),
                 Container(
                   child: Text("Within 2 hours",style: TextStyle(color: red,fontFamily: rubikFontBold)),
                 ),


               ],
             ),
           ),
         ],
       ),
     ),
   );
  }

  Widget _getItemList(BuildContext context, int i){
    return Card(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(7),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Text(
                      reportItem[i]
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.2,
                  child: Text(
                      "5 kg"
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