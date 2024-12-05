import 'package:flutter/material.dart';
import 'package:newsapp/components/news_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TabBar(
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 40),
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                unselectedLabelColor:
                    Theme.of(context).tabBarTheme.unselectedLabelColor,
                tabs: const [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.article),
                        SizedBox(width: 8),
                        Text('Headlines'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports),
                        SizedBox(width: 8),
                        Text('Sports'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.computer),
                        SizedBox(width: 8),
                        Text('Technology'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.health_and_safety),
                        SizedBox(width: 8),
                        Text('Health'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.movie),
                        SizedBox(width: 8),
                        Text('Entertainment'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: TabBarView(
                children: [
                  NewsTab(category: 'headlines'),
                  NewsTab(category: 'sports'),
                  NewsTab(category: 'technology'),
                  NewsTab(category: 'health'),
                  NewsTab(category: 'entertainment'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
