import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Color/SelectColor.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_app/data/DummyData.dart';
import 'package:flutter_app/model/Category.dart';
import 'package:flutter_app/model/ProductModel.dart';
import 'package:flutter_app/model/SaleItemModel.dart';

import 'DrawerPage.dart';
import 'SalesCart.dart';

class SalesAdd extends StatefulWidget {
  @override
  _SalesAddState createState() => new _SalesAddState();
}

class _SalesAddState extends State<SalesAdd> {
  bool visibility=false;
  int totalPrice=0;

  final List<Product> listProduct = List<Product>();
  TextEditingController editingController=TextEditingController();
  final List<Product> productItems=List<Product>();
  final List<Category> categoryList=List<Category>();

  final List<Product> cart=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productItems.addAll(DummyData.getItems());
    categoryList.addAll(DummyData.getCategories());
    print(categoryList.length);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          " Sale Item ",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'RubikBold',
              fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        actions: <Widget>[

        ],
      ),
      drawer: DrawerPage(),
      body: Container(
        child: Column(
          children: [
            _cartWidget(context,cart),
            _searchWidget(),
            _categoryWidget(categoryList),
            _productListWidget(productItems),
          ],
        ),
      ),
    );
  }




  _searchWidget() {

    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      height: MediaQuery.of(context).size.height * .06,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20,
              color: Colors.grey.withOpacity(.4),
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8))),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .07,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (value) {
                  searchResult(value);
                },

                //controller: editingController,

                cursorColor: Colors.blue,
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  hintText: 'Search Products',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.normal,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.search, color: Colors.blue), onPressed: null)
        ],
      ),
    );
  }




  void searchResult(String query){

    List<Product> searchList=List<Product>();
    searchList.addAll(DummyData.getItems());
    if(query.isNotEmpty){
      searchList.forEach((element) {
        if(element.productName.contains(query)){
          listProduct.add(element);
          print("query / "+ query);
        }
      });

      setState(() {
        productItems.clear();

        productItems.addAll(listProduct);
        listProduct.clear();

      });

      return;
    }else{
      setState(() {
        productItems.clear();
        productItems.addAll(searchList);
      });

    }
  }

  _categoryWidget(List<Category> categoryList) {
    return Container(
      height: 30,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context,index) {
          return GestureDetector(
            onTap: (){
              searchByCategory(categoryList[index].id);


            },
            child: Container(
              padding: EdgeInsets.all(5),
                margin: EdgeInsets.fromLTRB(2, 5, 2,0),
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(categoryList[index].categoryName))
            ),
          );
        }
      ),
    );
  }

  void searchByCategory(int id) {

    List<Product> productList=List<Product>();
    productItems.clear();
    productItems.addAll(DummyData.getItems());
    productItems.forEach((item) {
      if(item.cat_id==id){
        productList.add(item);
      }
    });
    setState(() {
      productItems.clear();
      productItems.addAll(productList);
      productList.clear();
    });


  }

  _productListWidget(List<Product> productItems) {
    return Expanded(
        child: GridView.count(
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 5,
          primary: false,
          crossAxisCount: 3,
          children: productItems //items
              .map((item) => Container(
            decoration: BoxDecoration(),
            child: Card(
                elevation: 10,
                child: InkWell(
                  onTap: (){
                    addToCart(item);
                    setState(() {
                      visibility=true;
                    });
                  },
                  child: Column(children: [
                    cardHeader(item),
                    cardBody(item),
                    cardFooter(item),
                  ]),
                )),
          ))
              .toList(),
        ));
  }

  void addToCart(Product item) {
    setState(() {
      cart.insert(0, item);
      totalPrice=totalPrice+int.parse(item.price);
    });
  }

  _cartWidget(BuildContext context, List<Product> cart) {
    return Visibility(
      visible: visibility,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(1),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(.8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Total Price : "+totalPrice.toString()+" Tk",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text(
                          "Place Order",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(

                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: cart.map((item) => Row(
                      children: [


                        Container(
                            height: MediaQuery.of(context).size.height*.05,
                            width: MediaQuery.of(context).size.width*.4,
                            margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            child: Center(child: Text(item.productName,style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),))
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height*.05,
                          width: MediaQuery.of(context).size.width*.2,
                          margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Center(child: Text(item.unit,style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),)),
                        ),




                        Container(
                          height: MediaQuery.of(context).size.height*.05,
                          width: MediaQuery.of(context).size.width*.2,
                          margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: Center(child: Text(item.price+" Tk",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),)),
                        ),



                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.05,
                            width: MediaQuery.of(context).size.width*.1,
                            margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            child: Center(child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    totalPrice=totalPrice-int.parse(item.price);
                                    cart.remove(item);
                                  });
                                },
                                child: Icon(Icons.clear,)
                            )),
                          ),
                        ),


                      ],
                    )).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }












}









cardHeader(Product product) {
  return Container(
      margin: EdgeInsets.fromLTRB(5, 8, 5, 0),
      child: Center(
        child: Column(
          children: [
            Text(
              product.productName,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Text(
              product.unit,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ));
}

cardBody(Product product) {
  return Expanded(
    child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
        child: Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Image.asset(
              "images/profile.png",
              height: 80,
              width: 80,
            ))),
  );
}

cardFooter(Product product) {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 8, 5, 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "210".toString() + " Tk",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    ),
  );
}



