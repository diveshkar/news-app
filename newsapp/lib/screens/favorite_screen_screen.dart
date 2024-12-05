import 'package:flutter/material.dart';
import 'package:newsapp/components/card_widget.dart';
import 'package:newsapp/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          final favorites = favoriteProvider.favorites;
          if (favorites.isEmpty) {
            return const Center(
              child: Text('No favorite articles yet.'),
            );
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return CardWidget(article: favorites[index]);
            },
          );
        },
      ),
    );
  }
}
