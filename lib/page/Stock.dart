import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Discount.dart';
import 'DrawerPage.dart';
import 'ItemList.dart';
import 'ProductCategory.dart';


class Stock extends StatefulWidget {
  @override
  _StockState createState() =>  _StockState() ;
}

class _StockState extends State<Stock>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        /*leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.white),
        ),*/

        title: Text(" Stocks ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
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
            height: 60,
            color: Colors.grey.withOpacity(0.1),
            margin: EdgeInsets.only(top: 15,bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width:MediaQuery.of(context).size.width*0.25,
                  child: Image.asset("images/crm.png",scale: 16,color: Colors.blue,),
                ),

                Container(
                  width:MediaQuery.of(context).size.width*0.45,
                  child: Text(
                      "Category",textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 17,
                  ),
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.width*0.25,
                  child: InkWell(
                    onTap: (){
                      gotoNextPage();
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.navigate_next,size: 30,color: Colors.white,),
                    ),
                  )
                )


              ],
            ),
          ),

          Container(
            height: 60,
            color: Colors.grey.withOpacity(0.1),
            margin: EdgeInsets.only(top: 10,bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width:MediaQuery.of(context).size.width*0.25,
                  child: Image.asset("assets/images/item.png",scale: 16,),
                ),

                Container(
                  width:MediaQuery.of(context).size.width*0.45,
                  child: Text(
                      "Item",textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 17,
                  ),
                  ),
                ),

                Container(
                  width:MediaQuery.of(context).size.width*0.25,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Route route = MaterialPageRoute(
                          builder: (context) => ItemCategory());
                          Navigator.push(context, route);
                    },
                      child:CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.navigate_next,size: 30,color: Colors.white,),
                    ),
                  )
                )


              ],
            ),
          ),
          Container(
            height: 60,
            color: Colors.grey.withOpacity(0.1),
            margin: EdgeInsets.only(top: 10,bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width:MediaQuery.of(context).size.width*0.25,
                  child: SvgPicture.asset("assets/images/discount.svg",height: 40,width: 40,),
                ),

                Container(
                  width:MediaQuery.of(context).size.width*0.45,
                  child: Text(
                      "Discounts",textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 17,
                  ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    Route route = MaterialPageRoute(
                        builder: (context) => Discount());
                        Navigator.push(context, route);
                  },
                  child: Container(
                    width:MediaQuery.of(context).size.width*0.25,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.navigate_next,size: 30,color: Colors.white,),
                    ),
                  ),
                )


              ],
            ),
          )
        ],
      ),

    );
  }

  gotoNextPage() {
    Navigator.pop(context);
    Route route = MaterialPageRoute(builder: (context)=>ProductCategory());
    Navigator.push(context, route);
  }
}
