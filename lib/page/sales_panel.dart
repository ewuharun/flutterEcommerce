import 'package:flutter/material.dart';
import 'package:flutter_app/Color/SelectColor.dart';


import 'DrawerPage.dart';

class SalesPanel extends StatefulWidget {
  @override
  _SalesPanelState createState() => _SalesPanelState();
}

class _SalesPanelState extends State<SalesPanel> {
  List customers = [
    "রাশেদুল ইসলাম",
    "সারওয়ার আলম",
    "রহিম মিয়া",
    "সাজ্জাদুর ইসলামলাম",
    "ফাহাদ আলম",
    "মিশুক মিয়া",
    "অনন্যা বেগম",
    "অরিন মিয়া",
  ];
  List recentCustomers = [
    "ফাহাদ আলম",
    "মিশুক মিয়া",
    "রাশেদুল ইসলাম",
    "সারওয়ার আলম",
    "রেজাউল হক",
    "অনন্যা বেগম",
    "অরিন মিয়া",
    "রাশেদুল ইসলাম",
    "সারওয়ার আলম",
    "রহিম মিয়া",
    "সাজ্জাদুর ইসলাম",
  ];
  List products = [
    "চাল",
    "চিনি",
    "মুড়ি",
    "দুধ",
    "বিস্কুট",
    "পানি",
    "চা পাতা",
    "চানাচুর",
  ];
  List recentProducts = [
    "চাল",
    "চিনি",
    "মুড়ি",
    "দুধ",
    "বিস্কুট",
    "পানি",
    "চা পাতা",
    "চানাচুর",
  ];
  List<String> categories = [
    "সব",
    "চাল ",
    "চিনি ",
    "মুড়ি ",
    "দুধ ",
    "বিস্কুট ",
    "পানি ",
    "চা পাতা ",
    "চানাচুর ",
    "সব",
    "চাল ",
    "চিনি ",
    "মুড়ি ",
    "দুধ ",
    "বিস্কুট ",
    "পানি ",
    "চা পাতা ",
    "চানাচুর ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "বিক্রি করুন",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: new IconThemeData(color: Color(SelectColor.getThemeColor())),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        drawer: DrawerPage(),
        backgroundColor: Colors.white,
        body: Column(
            children: <Widget>[
              Expanded(
                child:
                ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("ক্রেতাঃ"),
                        SizedBox(
                          width: 10.0,
                          child: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: (){
                              showSearch(context: context, delegate: DataSearch(customers,recentCustomers));
                            },),
                        ),
                        Text("পণ্যঃ"),
                        SizedBox(
                          width: 10.0,
                          child: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: (){
                              showSearch(context: context, delegate: DataSearch(products,recentProducts));
                            },),
                        )
                      ],
                    ),
                    new Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: new ListView.builder
                          (
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (BuildContext ctxt, int Index) {
                              return Container(
                                child: OutlineButton(
                                  child: Text(categories[Index],style: TextStyle(color: Colors.black),), onPressed: () {},
                                ),
                              ) ;
                            }
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.scanner),
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: Icon(Icons.flash_on),
                          onPressed: (){},
                        ),
                        FlatButton(
                          child: Text("1X", style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                    new Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                        child: new ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: categories.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctxt, int Index) {
                              return Container(
                                child: OutlineButton(
                                  child: showItem(categories[Index]),//Text(categories[Index],style: TextStyle(color: Colors.black),),
                              ),
                            ) ;
                          }
                      )
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Color(SelectColor.getThemeColor()),
                      child: Text("ADD to Cart"),
//                child: CameraPage(),
                      onPressed: () {
//                        createTodo();
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        );
  }
  Widget showItem(String name){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset("images/employee_manage.png"),
        ),
        Column(
          children: <Widget>[
            Text(name),
            Text(name),
            Text("৪৮"),
          ],
        ),
        IconButton(
          icon: Icon(Icons.add),
        )
      ],
    ),
  );
}
}

class DataSearch extends SearchDelegate<String>{
  List items;
  List recentItems;
  DataSearch(List items, List recentItems){
    this.items = items;
    this.recentItems = recentItems;
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear),
      onPressed: (){
      query ="";
      },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,),
        onPressed: (){
          close(context, null);
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? items
        : recentItems.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context,index)=>ListTile(
          leading: Icon(Icons.face),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
                )
              ]
            ),
          ),

    ),
    itemCount: suggestionList.length,);
  }
}