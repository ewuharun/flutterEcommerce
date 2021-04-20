import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_app/data/DummyData.dart';
import 'package:flutter_app/model/DiscountModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AddDiscount.dart';
import 'DrawerPage.dart';
import 'Stock.dart';


class Discount extends StatefulWidget {
  @override
  _DiscountState createState() =>  _DiscountState() ;
}

class _DiscountState extends State<Discount>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Stock())
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Icon(
                  Icons.arrow_back
              ),
            ),
          )
        ],

        title: Text(" All Discounts ",style: TextStyle(color: Colors.white,fontFamily: 'RubikBold',fontWeight: FontWeight.bold),),
        titleSpacing: 0,

      ),
      drawer: DrawerPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: (){
          Route route = MaterialPageRoute(builder: (context)=>AddDiscount());
          Navigator.push(context, route);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context,int index){
              return categoryItem(DummyData.getDiscounts()[index]);
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: DummyData.getDiscounts().length),

      ),
    );
  }

  Widget categoryItem(DiscountModel discounts) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(top: 10),
      leading: Container(
        width: MediaQuery.of(context).size.width*0.1,
        child: SvgPicture.asset("assets/images/discount.svg",height: 35,width: 35,),
      ),
      title: Container(
        width: MediaQuery.of(context).size.width*0.65,
        child: Text(discounts.discountName,softWrap: true,maxLines: 1,style: TextStyle(
            fontSize: 17,color: Colors.black,fontFamily: rubikFontBold
        ),
        ),
      ),
      trailing:
      Container(
        width: MediaQuery.of(context).size.width*0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(discounts.discountValue,style: TextStyle(
                fontFamily: rubikFont,fontSize: 18

            ),
            ),
            Icon(
              Icons.navigate_next,color: Colors.blue,size: 30,
            )
          ],
        ),
      ),
      onTap: (){

      },
    );
  }

}
