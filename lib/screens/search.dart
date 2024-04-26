import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State

<StatefulWidget> {
  // Define variables for search query
  String _imageSearchQuery = '';
  String _userSearchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image search section
            Text(
              'Search Images:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  _imageSearchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter image search query',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // User search section
            Text(
              'Search Users:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  _userSearchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter user search query',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // Search button
            ElevatedButton(
              onPressed: () {
                // Perform search based on queries
                // For now, we'll just print them
                print('Image search query: $_imageSearchQuery');
                print('User search query: $_userSearchQuery');
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}