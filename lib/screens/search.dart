import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State
<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (query) {
                // Implement search functionality here
              },
            ),
          ),
          // Search Results (Users)
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual user search results count
              itemBuilder: (context, index) {
                // Replace with user search result item widget
                return ListTile(
                  title: Text('User $index'),
                  onTap: () {
                    // Handle user tap
                  },
                );
              },
            ),
          ),
          // Search Results (Posts)
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual post search results count
              itemBuilder: (context, index) {
                // Replace with post search result item widget
                return ListTile(
                  title: Text('Post $index'),
                  onTap: () {
                    // Handle post tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}