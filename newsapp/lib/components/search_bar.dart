import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const Search({super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onSubmitted: (value) => onSearch(),
        decoration: InputDecoration(
          labelText: 'Search',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearch,
          ),
        ),
      ),
    );
  }
}
