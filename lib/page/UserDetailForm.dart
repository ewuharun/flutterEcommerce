import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'NewDashboard.dart';


class UserDetailForm extends StatefulWidget {
  @override
  _UserDetailFormState createState() => _UserDetailFormState ();

}

class _UserDetailFormState extends State<UserDetailForm> {
  String user_name;
  String shop_name;
  String shop_reg_name;
  String emergency_contact;
  String gender;
  String city;
  String area;
  String _gender = '';

  String _picked = '';


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
            /*Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => MobileOtp()),
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );*/
            // do something
          },
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left:50,right: 50,top: 20),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Please enter shop details to complete your registration .',
                      style: TextStyle(
                          fontSize: 17,color: darkBlue
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:30,right: 30, top: 30),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: false,
                        //fillColor: Colors.grey[100],
                        hintText: "Enter your name",
                        errorText: "Name required"
                      ),
                      onChanged: (value) {
                        this.user_name = value;
                      },
                      //controller: _phoneController,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: false,
                          //fillColor: Colors.grey[100],
                          hintText: "Enter shop name",
                          errorText: "shop Name required"
                      ),
                      onChanged: (value) {
                        this.shop_name = value;
                      },
                      //controller: _phoneController,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: false,
                          //fillColor: Colors.grey[100],
                          hintText: "Enter shop registration no",
                          errorText: "Registration no required"
                      ),
                      onChanged: (value) {
                        this.shop_reg_name = value;
                      },
                      //controller: _phoneController,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: false,
                          //fillColor: Colors.grey[100],
                          hintText: "Enter emergency contact",
                          errorText: "Contact required"
                      ),
                      onChanged: (value) {
                        this.emergency_contact = value;
                      },
                      //controller: _phoneController,
                    ),
                    SizedBox(height: 16,),

                    Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        'Select Gender   :',style: TextStyle(),
                      ),
                    ),

                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Radiobutton(),
                        ]
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Select city'
                        ),
                        CityDropDown()
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Select Area'
                        ),
                        AreaDropDown(),

                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Next",style: TextStyle(color: Colors.white,fontSize: 18),),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => NewDashboard())
                                );

                              },
                              child: Ink(
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child:Icon(
                                    Icons.chevron_right,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            )

                          ],
                        )
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),


      )

      );

  }
}

class Radiobutton extends StatefulWidget {
  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State {

  String radioItem = '';

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
          child:RadioListTile(
            dense: false,
            groupValue: radioItem,
            title: Text('Male'),
            value: 'Male',
            onChanged: (val) {
              setState(() {
                radioItem = val;
              });
            },
          ) ,
        ),
        SizedBox(
          height: 40,
          child: RadioListTile(
            dense: false,
            groupValue: radioItem,
            title: Text('Female'),
            value: 'Female',
            onChanged: (val) {
              setState(() {
                radioItem = val;
              });
            },
          ),
        ),

        SizedBox(
          height: 40,
          child:RadioListTile(
            dense: false,
            groupValue: radioItem,
            title: Text('Third Gender'),
            value: 'Third Gender',
            onChanged: (val) {
              setState(() {
                radioItem = val;
              });
            },
          ) ,
        )
        //Text('$radioItem', style: TextStyle(fontSize: 23),)

      ],
    );
  }
}

class CityDropDown extends StatefulWidget{
  @override
  CityDropDownWidget  createState() => CityDropDownWidget();
}

class CityDropDownWidget extends State {
  String dropdownValue = 'Dhaka';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width*0.4,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down,color: darkBlue,),
        iconSize: 28,
        elevation: 16,
        style: TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          width: 500,
          color: darkBlue,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Dhaka', 'Chattagram', 'Sylhet', 'Rangpur', 'Mymensingh','Barisal','Khulna','Rajshahi']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
class AreaDropDown extends StatefulWidget{
  @override
  AreaDropDownWidget  createState() => AreaDropDownWidget();
}

class AreaDropDownWidget extends State {
  String dropdownValue1 = 'Mirpur';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width*0.4,

      child: DropdownButton<String>(
        value: dropdownValue1,
        icon: Icon(Icons.arrow_drop_down,color: darkBlue,),
        iconSize: 28,
        elevation: 16,
        style: TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: darkBlue,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue1 = newValue;
          });
        },
        items: <String>['Mirpur', 'Badda', 'Bashundhora', 'Rampura', 'Khilgaon','Mohammadpur','Basabo','Kazipara']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
