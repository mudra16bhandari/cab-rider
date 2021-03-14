import 'package:cab_rider/screens/mainpage.dart';
import 'package:cab_rider/screens/registration_page.dart';
import 'package:cab_rider/widgets/TaxiButton.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../brand_colors.dart';

class LoginPage extends StatefulWidget {

  static const String id = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String title){
    final snackbar = SnackBar(
      content: Text(title, textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
    );
    ScaffoldMessenger.of(scaffoldKey.currentState.context).showSnackBar(snackbar);
  }

  void login() async {
    final User user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text).catchError((ex) {
      //check error and display message
      FirebaseAuthException thisEx = ex;
      showSnackBar(thisEx.message);
    })).user;
    if (user != null) {
      //verify login
      DatabaseReference userRef = FirebaseDatabase.instance.reference().child(
          'users/${user.uid}');
      userRef.once().then((DataSnapshot snapshot) {
        if(snapshot.value!=null){
          Navigator.pushNamedAndRemoveUntil(context, MainPage.id,(route) => false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage("images/logo1.png"),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Sign in as Rider!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email address',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TaxiButton(
                        title: "LOGIN",
                        color: BrandColors.colorBlueGray,
                        onPressed: () async{

                          //check network connection

                          var connectivityResult = await Connectivity().checkConnectivity();
                          if(connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi){
                            showSnackBar('No internet connectivity.');
                            return;
                          }


                          if(!emailController.text.contains('@')){
                            showSnackBar('Please enter a valid email address.');
                          }
                          if(passwordController.text.length<8){
                            showSnackBar('Please enter a valid password.');
                          }

                          login();

                        },
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, RegistrationPage.id,(route)=>false);
                  },
                  child: Text("Don't have an account? Sign up here!"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

