import 'package:flutter/material.dart';

class SortingMenu extends StatelessWidget {
  final Function(String) onSortSelected;

  const SortingMenu({super.key, required this.onSortSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.sort),
      onSelected: onSortSelected,
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'Date',
            child: Text('Sort by Date'),
          ),
          const PopupMenuItem<String>(
            value: 'Title',
            child: Text('Sort by Title'),
          ),
        ];
      },
    );
  }
}
