import 'package:flutter/material.dart';
import './../code/GlobalState.dart';
import '../screens/articleView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  GlobalState _store = GlobalState.instance;

  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Articles'),
        actions: <Widget>[
            new IconButton(icon: new Icon(Icons.add), onPressed: () => createArticle(context)),
          ],
      ),
      body:  
        new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Expanded(child: new ListView.builder(
                  itemCount: _store.getArticleListLength(),
                  itemBuilder: (BuildContext context, int index) => showArticle(context, index)
                ))
              ]
            )
          )
        )
    );
  }

  createArticle(BuildContext context) {
      Navigator.of(context).pushNamed('/Article'); 
  }

  Widget showArticle(BuildContext context, int index) {
  return new ListTile(
    leading: const Icon(Icons.event_seat),
    title: new Text('${_store.getArticleList()[index].headline}'),
    onTap: () {
      //Navigator.of(context).pushNamed('/Article'); 
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView.openArticle(_store.getArticleList()[index]),
          ),
        );
    }
  );
  }
}