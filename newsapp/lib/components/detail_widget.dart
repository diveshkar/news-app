import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/providers/favorites_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailWidget extends StatelessWidget {
  final NewsArticle article;

  const DetailWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final DateTime publishedDate = DateTime.parse(article.publishedAt);

    return Scaffold(
        appBar: AppBar(
          title: Text(article.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share('${article.title}\n\nRead more: ${article.url}');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.urlToImage.isNotEmpty)
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                const SizedBox(height: 10),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Published on: ${publishedDate.toLocal()}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  article.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Consumer<FavoriteProvider>(
                  builder: (context, favoriteProvider, child) {
                    final isFavorite = favoriteProvider.isFavorite(article);
                    return ElevatedButton.icon(
                      onPressed: () {
                        favoriteProvider.toggleFavorite(article);
                        if (!isFavorite) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to Favorites')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Removed from Favorites')),
                          );
                        }
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      label: Text(
                        isFavorite
                            ? 'Remove from Favorites'
                            : 'Add to Favorites',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
