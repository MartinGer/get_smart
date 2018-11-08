import 'package:flutter/material.dart';

class GlobalState {
  static int uniqueId = 0;
  final List<Article> _articleList = new List();
  static GlobalState instance = new GlobalState._();
  GlobalState._();

  add(Article article) => _articleList.add(article);

  get(int key) {
    for (var i = 0; i < this._articleList.length; i++) {
      if (key == _articleList[i].key) {
        return _articleList[i];
      }
    }
  }

  List getArticleList() {
    return _articleList;
  }

  int getArticleListLength() {
    return _articleList.length;
  }

  int getUniqueKey() {
    uniqueId++;
    return uniqueId;
  }

  bool articleExists(Article article) {
    bool exists = false;
    for (var i = 0; i < this._articleList.length; i++) {
      if (article.headline == _articleList[i].headline) {
        exists = true;
        break;
      }
    }
    return exists;
  }
}

class Article {
  Icon categorie;
  int key;
  String headline;
  String article;
  String sources;

  Article(Icon categorie, int key, String headline, String article, String sources) {
    this.categorie = categorie;
    this.key = key;
    this.headline = headline;
    this.article = article;
    this.sources = sources;
  }
}
