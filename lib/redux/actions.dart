import './../model/article.dart';

class AddArticleAction {
  final Article article;

  AddArticleAction(this.article){
  }
}

class ChangeArticleAction {
  final Article article;

  ChangeArticleAction(this.article);
}

class DeleteArticleAction {
  final Article article;

  DeleteArticleAction(this.article);
}