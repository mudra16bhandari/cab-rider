import 'package:cab_rider/screens/loginpage.dart';
import 'package:cab_rider/widgets/TaxiButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../brand_colors.dart';

class RegistrationPage extends StatelessWidget {

  static const String id = "register";
  
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  
  void showSnackBar(String title){
    final snackbar = SnackBar(
      content: Text(title, textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
    );
    ScaffoldMessenger.of(scaffoldKey.currentState.context).showSnackBar(snackbar);
    
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  void registerUser() async{
    final User user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text)).user;

    if(user!=null){
      print("Registration Successful!");
    }
    else{
      print("Some error occurred!");
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
                  "Create a Rider's Account!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      //Full name
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Full name',
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
                      //Email Address
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
                      // Phone Number
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Phone number',
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
                        title: "REGISTER",
                        color: BrandColors.colorBlueGray,
                        onPressed: (){
                          //check network connection
                          if(fullNameController.text.length < 3){
                            showSnackBar('Please provide a valid full name.');
                            return;
                          }
                          if(!emailController.text.contains('@')){
                            showSnackBar('Please provide a valid email address.');
                            return;
                          }
                          if(phoneController.text.length<10){
                            showSnackBar('Please provide a valid phone number.');
                            return;
                          }
                          if(passwordController.text.length<8){
                            showSnackBar('Password must have atleast 8 characters.');
                            return;
                          }

                          registerUser();
                        },
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id,(route)=>false);
                  },
                  child: Text("Already have a Rider's Account? Login!"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
