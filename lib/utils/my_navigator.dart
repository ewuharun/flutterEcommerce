import 'package:flutter/material.dart';
import 'package:flutter_app/page/LoginOrSignUp.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
  static void gotoHomeScreen(BuildContext context){
    Route route = MaterialPageRoute(builder: (context)=>LoginOrSignUp());
    Navigator.push(context, route);
  }
}
