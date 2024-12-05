import 'package:flutter/material.dart';
import 'package:newsapp/components/card_widget.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/services/news_service.dart';

class NewsTab extends StatelessWidget {
  final String category;

  const NewsTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsArticle>>(
      future: NewsService().fetchNews(type: category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No news available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return CardWidget(article: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}
