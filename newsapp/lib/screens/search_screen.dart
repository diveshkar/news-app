import 'package:flutter/material.dart';
import 'package:newsapp/components/card_widget.dart';
import 'package:newsapp/components/sorting_menu.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/services/news_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<NewsArticle> _newsArticles = [];
  bool _isSearching = false;
  String? _errorMessage;

  String _sortOption = 'Date';

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      final query = _searchController.text.trim();
      if (query.isNotEmpty) {
        _performSearch(query);
      } else {
        setState(() {
          _newsArticles = [];
          _errorMessage = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) async {
    setState(() {
      _isSearching = true;
      _errorMessage = null;
    });

    try {
      final List<NewsArticle> searchResults =
          await NewsService().fetchNews(type: query);
      setState(() {
        _newsArticles = searchResults;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to fetch search results: $e';
      });
    }

    setState(() {
      _isSearching = false;
    });
  }

  void _sortArticles(String sortOption) {
    if (_newsArticles.isNotEmpty) {
      setState(() {
        _sortOption = sortOption;
        if (_sortOption == 'Date') {
          _newsArticles.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
        } else if (_sortOption == 'Title') {
          _newsArticles.sort((a, b) => a.title.compareTo(b.title));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search News'),
        actions: [
          SortingMenu(onSortSelected: _sortArticles),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for news...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _isSearching
                ? const Center(
                    child: CircularProgressIndicator()) // Loading state
                : _errorMessage != null
                    ? Center(
                        child: Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    : _newsArticles.isNotEmpty
                        ? ListView.builder(
                            itemCount: _newsArticles.length,
                            itemBuilder: (context, index) {
                              return CardWidget(article: _newsArticles[index]);
                            },
                          )
                        : const Center(
                            child: Text(
                                'No results found. Try a different search.'),
                          ),
          ),
        ],
      ),
    );
  }
}
