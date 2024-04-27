import 'package:flutter/material.dart';
import 'package:photo_gram/screens/profile.dart';
import 'package:photo_gram/screens/search.dart';
import 'package:photo_gram/backend/user_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<StatefulWidget> {
  String _bio = "Enter your bio here";
  String? _profilePicUrl; // Profile picture URL
  List<String> _uploadedPictures = []; // List to store uploaded picture URLs
  List<String> _captions = []; // List to store captions for uploaded pictures
  TextEditingController _captionController = TextEditingController(); // Controller for caption input

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // Profile Picture
          _buildProfilePicture(),
          SizedBox(height: 10),
          // Upload Profile Picture Button
          ElevatedButton(
            onPressed: _uploadProfilePicture,
            child: Text("Upload Profile Picture"),
          ),
          SizedBox(height: 20),
          // Bio
          _buildBio(),
          SizedBox(height: 10),
          // Edit Bio Button
          ElevatedButton(
            onPressed: _editBio,
            child: Text("Edit Bio"),
          ),
          SizedBox(height: 20),
          // Upload Picture Section
          ElevatedButton(
            onPressed: () => _uploadPicture(context),
            child: Text("Upload Picture"),
          ),
          SizedBox(height: 20),
          // Uploaded Pictures Section
          _buildUploadedPictures(),
        ],
      ),
    );
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: _profilePicUrl != null
          ? NetworkImage(_profilePicUrl!)
          : AssetImage("assets/default_profile_pic.jpg") as ImageProvider,
    );
  }

  Widget _buildBio() {
    return Column(
      children: [
        Text(
          "Bio:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(_bio),
      ],
    );
  }

  Widget _buildUploadedPictures() {
    return Column(
      children: _uploadedPictures.asMap().entries.map((entry) {
        int index = entry.key;
        String pictureUrl = entry.value;
        String caption = _captions[index];
        return Column(
          children: [
            Image.network(pictureUrl),
            SizedBox(height: 8),
            Text(caption),
            SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }

  void _uploadProfilePicture() {
    // Implement profile picture upload logic
    // For demonstration purposes, we're using a dummy URL
    setState(() {
      _profilePicUrl = "https://example.com/profile_pic.jpg";
    });
  }

  void _editBio() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Bio"),
          content: TextField(
            onChanged: (text) {
              setState(() {
                _bio = text;
              });
            },
            decoration: InputDecoration(
              hintText: "Enter your bio here",
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Update bio in database
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _uploadPicture(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Upload Picture"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _captionController,
                decoration: InputDecoration(
                  hintText: "Enter caption for the picture",
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement picture upload logic
                  // For demonstration purposes, we're using a dummy URL and caption
                  setState(() {
                    _uploadedPictures.add("https://example.com/uploaded_picture.jpg");
                    _captions.add(_captionController.text);
                    _captionController.clear();
                  });
                  Navigator.of(context).pop();
                },
                child: Text("Upload"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }
}
