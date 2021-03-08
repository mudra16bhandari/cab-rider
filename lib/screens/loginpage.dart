import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Image(
            alignment: Alignment.center,
            height: 100.0,
            width: 100.0,
            image: AssetImage("images/logo.png"),
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
                RaisedButton(
                  onPressed: () {},
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0)),
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Brand-Bold',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Don't have an account? Sign up here!"),
          )
        ],
      ),
    );
  }
}
