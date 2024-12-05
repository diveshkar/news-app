import 'package:flutter/material.dart';
import 'package:newsapp/providers/favorites_provider.dart';
import 'package:newsapp/screens/main_screen.dart';
import 'package:newsapp/themes/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        title: 'News',
        debugShowCheckedModeBanner: false,
        theme: darkModeTheme,
        home: const MainScreen(),
      ),
    );
  }
}
