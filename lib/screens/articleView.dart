import 'package:flutter/material.dart';
import './../code/GlobalState.dart';

class ArticleView extends StatefulWidget {
  bool _editMode;
  Article _article;
  bool _hasText = false;

  ArticleView.openArticle(Article article) {
    this._article = article;
    this._editMode = false;
    this._hasText = true;
  }

  ArticleView() {
    this._editMode = true;
  }

  @override
  _ArticleState createState() => new _ArticleState();
}

class _ArticleState extends State<ArticleView> {
  GlobalState _store = GlobalState.instance;

  final headlineController = TextEditingController();
  final articleController = TextEditingController();
  final sourcesController = TextEditingController();

  List<DropdownMenuItem> _categories = [
    new DropdownMenuItem(child: new Icon(Icons.history), value: new Icon(Icons.history)),
    new DropdownMenuItem(child: new Icon(Icons.person), value: new Icon(Icons.person)),
    new DropdownMenuItem(child: new Icon(Icons.settings), value: new Icon(Icons.settings)), 
    new DropdownMenuItem(child: new Icon(Icons.map), value: new Icon(Icons.map)),
    new DropdownMenuItem(child: new Icon(Icons.arrow_right), value: new Icon(Icons.arrow_right)),
  ];

  Icon _curCategorie;

  @override
  void initState() {
    super.initState();

    if (widget._hasText) {
      _curCategorie = widget._article.categorie;
      headlineController.text = widget._article.headline;
      articleController.text = widget._article.article;
      sourcesController.text = widget._article.sources;
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the Widget is disposed
    headlineController.dispose();
    articleController.dispose();
    sourcesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Article'),
          actions: <Widget>[
            widget._editMode
                ? new IconButton(
                    icon: new Icon(Icons.save),
                    onPressed: () {
                      saveArticle();
                    })
                : new IconButton(
                    icon: new Icon(Icons.edit),
                    onPressed: () {
                      editArticle();
                    })
          ],
        ),
        body: new SingleChildScrollView(
            padding: new EdgeInsets.all(8.0),
                child: new Column(children: <Widget>[
                  new Row (
                    mainAxisAlignment: MainAxisAlignment.start,  
                    children: <Widget>[
                      new DropdownButton(
                        value: null,
                        items: _categories,
                        hint: _curCategorie,
                        onChanged: (value) {
                          setState(() {
                            _curCategorie = value;
                          });
                        }, 
                      ),
                    ]),
                  new TextField(
                    controller: headlineController,
                    decoration: new InputDecoration(
                      labelText: 'headline',
                      hintText: 'add your headline here',
                      enabled: widget._editMode ? true : false,
                    ),
                    maxLength: 50,
                    maxLengthEnforced: true,
                  ),
              new TextField(
                controller: articleController,
                decoration: new InputDecoration(
                  labelText: 'article',
                  hintText: 'add your article here',
                  enabled: widget._editMode ? true : false,
                ),
                maxLines: null,
              ),
              new TextField(
                controller: sourcesController,
                decoration: new InputDecoration(
                  labelText: 'sources',
                  hintText: 'add your sources here',
                  enabled: widget._editMode ? true : false,
                ),
                maxLines: null,
              ),
            ])));
  }

  saveArticle() {
    setState(() {
      widget._editMode = false;
    });
    if (headlineController.text != '') {
      Article article = new Article(
          _curCategorie,
          GlobalState.uniqueId,
          headlineController.text,
          articleController.text,
          sourcesController.text);
      if (!_store.articleExists(article)) {
        _store.add(article);
        GlobalState.uniqueId++;
      }
    }
  }

  editArticle() {
    setState(() {
      widget._editMode = true;
    });
  }
}
