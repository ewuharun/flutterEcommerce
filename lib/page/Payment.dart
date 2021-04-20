import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'DrawerPage.dart';


class Payment extends StatefulWidget{

  double total;
  Payment({this.total});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(" Select Payment Method ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
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
          color: Colors.white.withOpacity(0.1),
          elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 30,
              child: Align(
                child: Text("Total : 2000  taka",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 18,fontFamily: rubikFont,color: darkBlue,
                ),),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: (){
                Route route = MaterialPageRoute(builder: (context) => null);
                Navigator.push(context, route);
              },
              child: Container(
                color:Colors.blue,
                width: MediaQuery.of(context).size.width,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width*0.15,
                      child: Image.asset("assets/images/pos_printer.png",fit: BoxFit.fill,width: 44,height: 34,),
                    ),
                    Container(
                      color: Colors.blue,
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Text(
                        "Confirm Sale",style: TextStyle(
                        fontSize: 18,fontFamily: rubikFontBold,color: Colors.white,
                      ),
                      ),
                      alignment: Alignment.center,
                    ),

                    Icon(
                      Icons.navigate_next,color: Colors.white,size: 30,
                    )
                    ],
                ),
                height: 50,
                padding: EdgeInsets.only(left: 15),
              ),
            )
          ],
        )
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              width:MediaQuery.of(context).size.width,
              child: Text(
                "Recommended Method(s)",style: TextStyle(
                fontSize: 14,fontFamily: rubikFont,color:darkBlue,
              ),
              ),
              padding: EdgeInsets.all( 5),
            ),
            Card(
                elevation: 0.1,
                color: Colors.white,
                child: Container(
                    padding: EdgeInsets.only(top: 5,bottom: 5),
                    child:
                    InkWell(
                      onTap:(){
                        /*Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CheckOut())
                        );*/
                      },
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only( top: 15,left: 20,bottom: 15),
                            //width: MediaQuery.of(context).size.width*0.57,
                            child: Text( "Save bKash Account",textAlign: TextAlign.center,style: TextStyle(
                              fontFamily: rubikFontBold,fontSize: 16,color: Colors.black.withOpacity(0.6)
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only( top: 15,left: 20,bottom: 15),
                            //width: MediaQuery.of(context).size.width*0.3,
                            child: Icon(
                              Icons.chevron_right,
                              color: darkBlue,size: 32,
                            ),
                          ),
                        ],
                      ),
                    )
                )
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              child: Text(
                "Payment Method(s)",style: TextStyle(
                fontSize: 14,fontFamily: rubikFont,color:darkBlue,
              ),
              ),
              padding: EdgeInsets.all( 5),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only( top: 15,left: 20,bottom: 5),
                            //width:MediaQuery.of(context).size.width*0.57,
                            child: Text(
                              "Credit / Debit Card",textAlign: TextAlign.center,style: TextStyle(
                                fontFamily: rubikFontBold,fontSize: 16,color: Colors.black.withOpacity(0.6)
                            ),
                            ),

                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width*0.3,
                            padding: EdgeInsets.only( top: 15,right: 20,bottom: 5),
                            child: Icon(
                              Icons.chevron_right,
                              color: darkBlue,size: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Divider(color: Colors.grey.withOpacity(0.8),)
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            //width:MediaQuery.of(context).size.width*0.57,
                            padding: EdgeInsets.only( top: 7.5,left: 20,bottom: 2.5),
                            child: Text(
                              "Cash on Delivery",textAlign: TextAlign.center,style: TextStyle(
                                fontFamily: rubikFontBold,fontSize: 16,color: Colors.black.withOpacity(0.6)
                            ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only( top: 7.5,right: 20,bottom: 2.5),
                            //width: MediaQuery.of(context).size.width*0.3,
                            child: Icon(
                              Icons.chevron_right,
                              color: darkBlue,size: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new Divider(color: Colors.grey.withOpacity(0.8),)
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only( top: 5,left: 20,bottom: 15),
                            //width:MediaQuery.of(context).size.width*0.57,
                            child: Text(
                              "Bakir Khata",textAlign: TextAlign.center,style: TextStyle(
                                fontFamily: rubikFontBold,fontSize: 16,color: Colors.black.withOpacity(0.6)
                            ),
                            ),
                          ),
                          Container(
                           // width: MediaQuery.of(context).size.width*0.3,
                            padding: EdgeInsets.only( top: 5,right: 20,bottom: 15),
                            child: Icon(
                              Icons.chevron_right,
                              color: darkBlue,size: 32,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              )
            ),
          ],
        ),
      )



    );
  }

}
