import 'package:flutter/material.dart';
import './screens/articleView.dart';
import './screens/home.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
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