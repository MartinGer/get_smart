import 'package:cloud_firestore/cloud_firestore.dart';
import './../models/Article.dart';
import 'dart:async';

class FirebaseService {
  CollectionReference db = Firestore.instance.collection('articleData');

  static final FirebaseService firebaseService = new FirebaseService._();
  FirebaseService._();

  static FirebaseService get() {
    return firebaseService;
  }

  void addToFirebase(Article article) {
    addArticle(article);
    if (articleExists(article)) {
      updateArticle(article);
    } else {
      addArticle(article);
    }
  }

  bool articleExists(Article article) {
      db.snapshots().contains(article.headline).then((result) {
        return result;
      });
    }

  void addArticle(Article article) async {
    db.document(article.headline).setData(article.toJson());
  }
 
  void updateArticle(Article article) {
      db.document(article.headline).updateData(article.toJson());
  }
 
  void deleteArticle(Article article) {
    db.document(article.headline).delete();
  }
}