import './../model/article.dart';
import './../redux/actions.dart';
import './../model/globalState.dart';

GlobalState globalStateReducer(GlobalState state, action) {
  return GlobalState(
    articleReducer(state.articleList, action),
  );
}

List<Article> articleReducer(List<Article> articles, dynamic action) {
  if (action is AddArticleAction) {
    return addArticle(articles, action);
  } else if (action is ChangeArticleAction) {
    return changeArticleState(articles, action);
  } else if (action is DeleteArticleAction) {
    return deleteArticle(articles, action);
  }
  return articles;
}

List<Article> addArticle(List<Article> articles, AddArticleAction action) {
  if(articleExists(articles, action.article)){
    return articles;
  } else {
    GlobalState.uniqueId++;
    return new List.from(articles)..add(action.article);
  }
}

List<Article> changeArticleState(List<Article> articles, ChangeArticleAction action) {
  // List<Article> articlesNew = articles
  //     .map((article) => article.name == action.article.name ? action.article : article)
  //     .toList();
  // return articlesNew;
}

List<Article> deleteArticle(List<Article> articles, DeleteArticleAction action) {
  // return new List.from(articles)..remove(action.article);
}

bool articleExists(List<Article> articles, Article article) {
  bool exists = false;
  for (var i = 0; i < articles.length; i++) {
    if (article.headline == articles[i].headline) {
      exists = true;
      break;
    }
  }
  return exists;
}
