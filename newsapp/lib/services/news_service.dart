import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_model.dart';

class NewsService {
  final String key = '3caffec2702548499eef3c7c73fe9f93';
  final String apiUrl = 'https://newsapi.org/v2';

  Future<List<NewsArticle>> fetchNews({String type = ''}) async {
    http.Response response;

    if (type == 'headlines') {
      response = await http.get(
        Uri.parse('$apiUrl/top-headlines?country=us&apiKey=$key'),
      );
    } else {
      response = await http.get(
        Uri.parse('$apiUrl/everything?q=$type&apiKey=$key'),
      );
    }

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articles = data['articles'];
      return articles.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
