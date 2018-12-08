import 'package:flutter/material.dart';
import './../code/utils.dart';
import '../screens/articleView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './../models/Article.dart';
import './../code/firebase.service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseService _firebaseService = FirebaseService.get();

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
      body: _buildBody(context),
    );
  }

  createArticle(BuildContext context) {
    Navigator.of(context).pushNamed('/Article');
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('articleData').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final article = Article.fromSnapshot(data);

    return Dismissible(
        key: Key(article.headline),
        onDismissed: (direction) {
          _firebaseService.deleteArticle(article);
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Article ${article.headline} deleted')));
        },
        background: Container(color: Colors.red),
        child: ListTile(
            leading: getIcon(article.categorie),
            title: Text(article.headline),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleView.openArticle(article),
                ),
              );
            }));
  }
}
