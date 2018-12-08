import 'package:flutter/material.dart';
import './screens/articleView.dart';
import './screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:io';

//final FirebaseAuth _auth = FirebaseAuth.instance;

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  // @override

  // void initState() {
  //   signInAnon();
  // }

  // void signInAnon() async {
  //   FirebaseUser user = await _auth.signInAnonymously();
  //   if (user != null && user.isAnonymous == true) {
  //     print('Signed in Anonymously');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Articles',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/Article': (BuildContext context) => new ArticleView(),
      },
      home: new Home(),
    );
  }
}
