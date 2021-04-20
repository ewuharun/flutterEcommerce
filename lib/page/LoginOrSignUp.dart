import 'package:flutter/material.dart';
import 'package:flutter_app/Color/SelectColor.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'LoginScreen.dart';
import 'SignupPage.dart';
import 'loginPage.dart';

class LoginOrSignUp extends StatefulWidget {
  @override
  _LoginOrSignUpState createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: _controller,
            physics: new AlwaysScrollableScrollPhysics(),
            children: <Widget>[LoginScreen(), HomePage(), SignupPage()],
            scrollDirection: Axis.horizontal,
          )),
    );
  }

  Widget HomePage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,//Color(Helper.getHexToInt('FFB46A'))
//        image: DecorationImage(
//          colorFilter: new ColorFilter.mode(
//              Colors.black.withOpacity(0.1), BlendMode.dstATop),
//          image: AssetImage('assets/images/mountains.jpg'),
//          fit: BoxFit.cover,
//        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 200.0),
            child: Center(
              child: SizedBox(
                height: 40.0,
              ),
//              Icon(
//                Icons.headset_mic,
//                color: Colors.white,
//                size: 40.0,
//              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0,bottom: 20),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Fordo", style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontFamily:rubikFontBold),

              ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: SvgPicture.asset("assets/images/fordo_shop.svg",height: 60,width: 60,),


          ),
                /*Image.asset(
                  "assets/images/fordo_shop.png",
                  height:60,
                  width: 60,
                ),*/
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          /*new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
//                    color: Colors.redAccent,
                    color: Color(SelectColor.getThemeColor()),
//                    highlightedBorderColor: Colors.white,
                    onPressed: () => gotoSignup(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),*/
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(SelectColor.getThemeColor()),//Colors.black,
                    onPressed: () => gotoLogin(),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }
}
