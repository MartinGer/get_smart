import 'package:flutter/material.dart';

import './../model/globalState.dart';
import '../screens/articleView.dart';
import './../model/article.dart';
import './../model/viewModel.dart';
import './../redux/actions.dart';
import './../redux/reducers.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Articles'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () => createArticle(context)),
          ],
        ),
        body: new Container(
            padding: new EdgeInsets.all(8.0),
            child: new Center(
                child: new StoreConnector<GlobalState, List<Article>>(
                    converter: (Store<GlobalState> store) =>
                        store.state.articleList,
                    builder: (BuildContext context, articleList) =>
                        ArticleListWidget(articleList)))));
  }

  createArticle(BuildContext context) {
    Navigator.of(context).pushNamed('/Article');
  }
}

class ArticleListWidget extends StatelessWidget {
  final List<Article> articleList;

  ArticleListWidget(this.articleList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: 
          this.articleList
          .map((Article article) => Dismissible(
                key: Key((article.key).toString()),
                onDismissed: (direction) {            
                    this.articleList.remove(article);              
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Article ${article.headline} deleted')));
                },
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(article.headline),
                  leading: article.categorie,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleView.openArticle(article),
                      ),
                    );
                  },
                ),
              ))
          .toList(),
    );
  }

  // Widget showArticle(BuildContext context, int index) {
  //   final article = _store.getArticleList()[index];
  //   return Dismissible(
  //     key: Key((article.key).toString()),
  //     onDismissed: (direction) {
  //       setState(() {
  //                 _store.getArticleList().removeAt(index);
  //               });

  //     Scaffold.of(context)
  //           .showSnackBar(SnackBar(content: Text('Article ${article.headline} deleted')));
  //     },
  //     background: Container(
  //       color: Colors.red
  //       ),
  //     child: ListTile(
  //         leading: _store.getArticleList()[index].categorie,
  //         title: new Text('${_store.getArticleList()[index].headline}'),
  //         onTap: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => ArticleView.openArticle(_store.getArticleList()[index]),
  //               ),
  //             );
  //         }
  //       )
  //    );
  // }
}
