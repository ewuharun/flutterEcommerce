import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';

import 'DrawerPage.dart';
import 'Payment.dart';


class SalesCart extends StatefulWidget{
  @override
  _SalesCartState createState() => new _SalesCartState();

}

class _SalesCartState  extends State<SalesCart>{

  List cartItems = [
  "চাল",
  "চিনি",
  "মুড়ি",
  "দুধ",
  "বিস্কুট",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(" Sales Cart ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
        titleSpacing: 0,
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        elevation: 1,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width:MediaQuery.of(context).size.width*0.7,
              child: Text(
                "Proceed to Payment",style: TextStyle(
                fontSize: 18,fontFamily: rubikFontBold,color: Colors.white,
              ),
              ),
              padding: EdgeInsets.only(left: 15),
            ),
            /*Container(
               //padding: EdgeInsets.only(left: 60),
               width: MediaQuery.of(context).size.width*0.45,
               child: Text("Total : ${totalCartAmount}",textAlign: TextAlign.right,style: TextStyle(
                 fontSize: 18,fontFamily: rubikFont,color: Colors.white,
               ),),
             ),*/
            Container(
              width: MediaQuery.of(context).size.width*0.15,
              //padding: EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(Icons.chevron_right,color: Colors.white,size: 35,),
                onPressed: () {
                  Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Payment())
                   );
                },
              ),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10,bottom: 5,left: 0,right: 10),
              child: Text("Your items", style: TextStyle(fontSize: 18,fontFamily: rubikFont,color: darkBlue),),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Shop Name ", style: TextStyle(color: Colors.white),),
                        Text("Total :  2000 ৳ ", style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ) ,
                ],

              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder:_getItemList,
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                  );
                },
                itemCount: cartItems.length,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _getItemList(BuildContext context, int index) {
    return Card(
      elevation: 0,
      child:
      Container(
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(cartItems[index]),
                            Text("৳ 500"),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                onPressed: () {
                                  /*int newQuantity = cartProduct.itemQuantity + 1;
                                  updateCartItem(cartProduct.productId, newQuantity);
                                  print("shopping cart");*/
                                },
                                heroTag: null,
                                backgroundColor: darkBlue,
                                child: Icon(Icons.add),
                              ),
                            ),
                            /*Arc(
                            edge: Edge.LEFT,
                            arcType: ArcType.CONVEY,
                            height: 7.0,
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(context, '/arc_demo'),
                              child: Container(
                                color: Colors.white,
                                width: 30.0,
                                height: 30.0,
                                child: Center(child: Text('')),
                              ),
                            ),
                          ),*/
                            Container(
                              color: Colors.white,
                              width: 40.0,
                              height: 30.0,
                              child: Center(child: Text("5",style: TextStyle(color: darkBlue),)),
                            ),
                            /*Arc(
                            edge: Edge.RIGHT,
                            arcType: ArcType.CONVEY,
                            height: 7.0,
                            child: GestureDetector(
                              onTap: () => Navigator.pushNamed(context, '/arc_demo'),
                              child: Container(
                                color: Colors.white,
                                width: 30.0,
                                height: 30.0,
                                child: Center(child: Text('')),
                              ),
                            ),
                          ),*/
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: navDrawerBgColor,
                                child: Icon(Icons.remove),
                                onPressed: (){
                                  /*int newQuantity = cartProduct.itemQuantity - 1;
                                  if(newQuantity == 0){
                                    deleteCartItem(cartProduct.productId);
                                  }
                                  else {
                                    updateCartItem(cartProduct.productId, newQuantity);
                                  }*/
                                },
                              ),
                            ),
                          ],
                        )
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