import 'package:flutter/material.dart';
import './../model/article.dart';

class GlobalState {
  static int uniqueId = 0;
  final List<Article> articleList;

  GlobalState(this.articleList);

  factory GlobalState.initial() => GlobalState(List.unmodifiable(<Article>[]));
}

