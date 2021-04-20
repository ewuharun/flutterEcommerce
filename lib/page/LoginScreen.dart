import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_app/constant/ThemeColor.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'NewDashboard.dart';
import 'UserDetailForm.dart';


class LoginScreen extends StatefulWidget{
  @override
  LoginScreenState createState()=> LoginScreenState();

}

class LoginScreenState  extends State<LoginScreen>{
  FocusNode myFocusNode = new FocusNode();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isUserSignedIn = false;
//facebook login
  bool isLoggedIn = false;
  bool isLoading = false;
  var profileData;

  var facebookLogin = FacebookLogin();

  TextEditingController controller = new TextEditingController();

  String countryCode = '+88';
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
    Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "$countryCode${this.phoneNo}", // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message} failed');
          });
    } catch (e) {
      handleError(e);
    }
  }

    Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter SMS Code'),
            content: Container(
              height: 85,
              child: Column(children: [
                TextField(
                  onChanged: (value) {
                    this.smsOTP = value;
                  },
                ),
                (errorMessage != ''
                    ? Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  _auth.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => UserDetailForm()));
                    } else {
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

    signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => UserDetailForm()));
    } catch (e) {
      handleError(e);
    }
  }

    handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          print('sign in');
        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });

        break;
    }
  }

    void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
      setState(() {
        isLoading = false;
        this.isLoggedIn = isLoggedIn;
        this.profileData = profileData;
      });
    }

    @override
    void initState() {
      super.initState();

      checkIfUserIsSignedIn();
    }

    void checkIfUserIsSignedIn() async {
      var userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }


    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      userNameController.dispose();
      passwordController.dispose();
    }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Center(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  "FORDO",
                  style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontFamily:'Pacifico'),
                ),

                SizedBox(
                  height: 60,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Register with Mobile number  ',style: TextStyle(color: Colors.white),
                    ),
                    Container(

                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 50,right: 50,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 45,
                            //width: MediaQuery.of(context).size.width*0.77,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[100],
                              border:Border(
                                  left: BorderSide(
                                      color: Colors.grey[200]
                                  ),
                                  right: BorderSide(
                                      color: Colors.grey[200]
                                  ),
                                  bottom: BorderSide(
                                      color: Colors.grey[200]
                                  ),
                                  top: BorderSide(
                                      color: Colors.grey[200]
                                  )
                              ),
                            ),
                            padding: EdgeInsets.only(left: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width*0.05,
                                  child: Image.asset("assets/images/bd_flag.png",
                                    height:25,
                                    width: 25,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 5),
                                  width: MediaQuery.of(context).size.width*0.1,
                                  child: Text(
                                    countryCode,style: TextStyle(
                                    fontSize: 15,fontFamily: rubikFont
                                  ),
                                  ),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width*0.01,
                                    height: 80,
                                    child: VerticalDivider(color: Colors.grey)
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 5),
                                  width: MediaQuery.of(context).size.width*0.45,
                                  child: TextFormField(
                                    showCursor: true,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 17,color: Colors.black,fontFamily: rubikFont
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                        //filled: true,
                                        //fillColor: Colors.grey[100],
                                        hintText: "11 digit mobile no",
                                      /*suffixIcon:new IconButton(
                                        highlightColor: Colors.transparent,
                                        icon: new Container(child: new Icon(Icons.clear,size: 18,)),
                                        onPressed: () {
                                          controller.clear();
                                        },
                                      ),*/

                                    ),
                                    onChanged: (value) {
                                      this.phoneNo = value;
                                    },
                                    //controller: controller,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width*0.1,
                                  child:InkWell(
                                    onTap: (){
                                      if(this.phoneNo == null || this.phoneNo.length == 0 ){
                                        Fluttertoast.showToast(
                                            msg: "Please enter the mobile no",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIos: 1,

                                        );
                                        print(" ${errorMessage}");
                                      }
                                      else{
                                        verifyPhone();
                                      }
                                    },
                                    child:Icon(
                                      Icons.chevron_right,
                                      color: Colors.blue,
                                    ),

                                  ),
                                ),
                                (errorMessage != ''
                                    ? Text(
                                  errorMessage,
                                  style: TextStyle(color: Colors.red),
                                )
                                    : Container(

                                )
                                ),


                              ],
                            )

                          )
                        ],
                      ),
                    )


                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                padding: EdgeInsets.only(left: 50,right: 50,top: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          onGoogleSignIn(context);
                        },
                        color: Colors.red,
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //Icon(Icons.account_circle, color: Colors.white),
                                Image.asset("assets/images/google_plus.png",
                                  height:40,
                                  width: 40,
                                ),
                              ],
                            )
                        )
                    )
                )
            ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.only(left: 50,right: 50,top: 10),
                    child: Align(
                        alignment: Alignment.center,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () {
                              initiateFacebookLogin();
                            },
                            color: darkBlue,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    //Icon(Icons.account_circle, color: Colors.white),
                                    Image.asset("assets/images/facebook.png",
                                      height:40,
                                      width: 40,
                                    ),
                                  ],
                                )
                            )
                        )
                    )
                ),


              ],
            ),
          ),
        ),
    );
  }

  void initiateFacebookLogin() async {
    var facebookLoginResult = await facebookLogin.logIn(['email',]);
    print(facebookLoginResult.errorMessage);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}');

        var profile = JSON.json.decode(graphResponse.body);
        print("Show FB Data"+profile.toString());
        onLoginStatusChanged(true, profileData: profile);
        Navigator.pop(context);
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) =>
                  NewDashboard()),
        );
        break;

    }
  }

  Future<FirebaseUser> _handleSignIn() async {
    FirebaseUser user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = await _auth.currentUser();
    }
    else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }
  void onGoogleSignIn(BuildContext context) async {
    FirebaseUser user = await _handleSignIn();

    if(user != null)
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NewDashboard()),
      );
  }
}