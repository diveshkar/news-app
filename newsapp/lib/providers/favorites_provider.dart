import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';

class FavoriteProvider with ChangeNotifier {
  final List<NewsArticle> _favorites = [];

  List<NewsArticle> get favorites => _favorites;

  bool isFavorite(NewsArticle article) {
    return _favorites.contains(article);
  }

  void toggleFavorite(NewsArticle article) {
    if (isFavorite(article)) {
      _favorites.remove(article);
    } else {
      _favorites.add(article);
    }
    notifyListeners();
  }
}
