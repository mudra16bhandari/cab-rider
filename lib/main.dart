import 'package:cab_rider/screens/loginpage.dart';
import 'package:cab_rider/screens/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(  // method helps configure firebase in app
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(                               //takes in properties from firebase project
      appId: '1:297855924061:ios:c6de2b69b03a5be8',
      apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
      projectId: 'flutter-firebase-plugins',
      messagingSenderId: '297855924061',
      databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
    )
        : FirebaseOptions(                                  //for android, will only be changing its properties
      appId: '1:417254683588:android:67197d4729999d8f68aa91',  //from json file, mobilesdk_app_id
      apiKey: 'AIzaSyCCexF3pcvgGxT7ozOhhUR80jQYGjpzIo8',    //from json file, current key
      messagingSenderId: '417254683588',
      projectId: 'cab-rider-1944',
      databaseURL: 'https://cab-rider-1944-default-rtdb.firebaseio.com',  //url from json file
    ),
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Brand-Regular',
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
