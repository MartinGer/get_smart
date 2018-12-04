import 'package:flutter/material.dart';

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