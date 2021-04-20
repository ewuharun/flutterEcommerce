import 'package:flutter/material.dart';

class cartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "Total : 300 Tk",
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
          Container(
            child: Table(
              children: [
                TableRow(
                    children: [
                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('Rice',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('1x2 kg',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('500 Tk',style: TextStyle(fontSize: 18,color: Colors.white),)])),

                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Icon(Icons.clear,color: Colors.black,size: 21,)])),


                    ]),



                TableRow(
                    children: [


                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('Rice',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('1x2 kg',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('500 Tk',style: TextStyle(fontSize: 18,color: Colors.white),)])),

                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Icon(Icons.clear,color: Colors.black,size: 21,)])),


                    ]),



                TableRow(
                    children: [


                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('Rice',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('1x2 kg',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('500 Tk',style: TextStyle(fontSize: 18,color: Colors.white),)])),

                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Icon(Icons.clear,color: Colors.black,size: 21,)])),


                    ]),





                TableRow(
                    children: [


                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('Rice',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('1x2 kg',style: TextStyle(fontSize: 18,color: Colors.white),)])),


                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Text('500 Tk',style: TextStyle(fontSize: 18,color: Colors.white),)])),

                      Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0,5),
                                    blurRadius: 50,
                                    color: Colors.grey.withOpacity(.7)
                                )
                              ]
                          ),
                          child: Column(children: [Icon(Icons.clear,color: Colors.black,size: 21,)])),

                    ]),

              ],
            ),
          ),
        ],
      ),
    );
  }
}