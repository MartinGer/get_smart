import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String categorie;
  String headline;
  String article;
  String sources;
  DocumentReference reference;

  Article(String categorie, String headline, String article,
      String sources) {
    this.categorie = categorie;
    this.headline = headline;
    this.article = article;
    this.sources = sources;
  }

  Article.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['headline'] != null),
        categorie = map['categorie'],
        headline = map['headline'],
        article = map['article'],
        sources = map['sources'];

  Article.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson() =>
  {
    'categorie': this.categorie,
    'headline': this.headline,
    'article': this.article,
    'sources': this.sources
  };

}

