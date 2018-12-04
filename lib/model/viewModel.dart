import './../model/globalState.dart';
import '../screens/articleView.dart';
import './../model/article.dart';
import './../redux/actions.dart';
import './../redux/reducers.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final List<Article> articleList;
  final Function(Article) onAddArticle;
  final Function(Article) onRemoveArticle;
  final Function(Article) onChangeArticle;

  _ViewModel({
    this.articleList,
    this.onAddArticle,
    this.onRemoveArticle,
    this.onChangeArticle,
  });

  factory _ViewModel.create(Store<GlobalState> store) {
    _onAddArticle(Article article) {
      store.dispatch(AddArticleAction(article));
    }

    _onRemoveArticle(Article article) {
      store.dispatch(DeleteArticleAction(article));
    }

     _onChangeArticle(Article article) {
      store.dispatch(ChangeArticleAction(article));
    }

    return _ViewModel(
      articleList: store.state.articleList,
      onAddArticle: _onAddArticle,
      onRemoveArticle: _onRemoveArticle,
      onChangeArticle: _onChangeArticle,
    );
  }
}