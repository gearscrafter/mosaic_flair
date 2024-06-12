import 'package:flutter/material.dart';

import '../molecules/search_bar.dart';

class SearchTemplate extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearch;

  const SearchTemplate({
    super.key,
    required this.searchController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          SearchBarM(
            controller: searchController,
            onSearch: onSearch,
          ),
        ],
      ),
    );
  }
}
