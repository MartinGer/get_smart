import 'package:flutter/material.dart';
import './screens/articleView.dart';
import './screens/home.dart';
import './model/article.dart';
import './model/globalState.dart';
import './redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    final Store<GlobalState> store = new Store<GlobalState>(
      globalStateReducer,
      initialState: GlobalState.initial(),
    );

    return StoreProvider<GlobalState>(
      store: store,
      child: new MaterialApp(
        title: 'Articles',
        routes: <String, WidgetBuilder>{
          '/Home': (BuildContext context) => new Home(),
          '/Article': (BuildContext context) => new ArticleView(),
        },
        home: new Home(),
      )
    );
  }
}