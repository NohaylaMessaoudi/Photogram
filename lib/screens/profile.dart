import 'package:flutter/material.dart';
import 'package:photo_gram/screens/add_post.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State
<StatefulWidget> {
  String _bio = "Enter your bio here";
  String _profilePicUrl = ""; // Add URL of profile picture
  List<String> _uploadedPictures = []; // List to store uploaded picture URLs
  List<String> _captions = []; // List to store captions for uploaded pictures

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          // Profile Picture
          CircleAvatar(
            radius: 50,
            backgroundImage: _profilePicUrl.isNotEmpty
                ? NetworkImage(_profilePicUrl)
                : AssetImage("assets/default_profile_pic.jpg") as ImageProvider,
          ),
          SizedBox(height: 10),
          // Upload Picture Section
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPost(
                  onPictureUploaded: (imageUrl, caption) {
                    setState(() {
                      _uploadedPictures.add(imageUrl);
                      _captions.add(caption);
                    });
                  },
                )),
              );
            },
            child: Text("Upload Picture"),
          ),
          SizedBox(height: 20),
          // Bio
          Text(
            "Bio:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(_bio),
          SizedBox(height: 10),
          // Edit Bio Button
          ElevatedButton(
            onPressed: () {
              _editBioDialog(context);
            },
            child: Text("Edit Bio"),
          ),
          SizedBox(height: 20),
          // Uploaded Pictures Section
          if (_uploadedPictures.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: _uploadedPictures.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(_uploadedPictures[index]),
                  title: Text(_captions[index]),
                );
              },
            ),
        ],
      ),
    );
  }

  void _editBioDialog(BuildContext context) {
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
                setState(() {
                  // Update bio in database
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}