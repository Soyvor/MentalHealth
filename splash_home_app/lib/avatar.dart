import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:splash_home_app/home_page.dart'; // For picking images

class AvatarPage extends StatefulWidget {
  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // List of customizable avatars (for example, you can add image paths of avatars here)
  List<String> avatars = [
    'assets/images/a1.jpeg', // Add your asset image paths here
    'assets/images/a2.jpeg',
    'assets/images/a3.jpeg',
  ];

  // Function to navigate to home page
  void _navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'hello')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4D3C2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF4D3C2C),
        elevation: 0,
        title: Text('Profile Setup', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.brown[700], // Background color for avatar area
              ),
              child: _image == null
                  ? Icon(Icons.person, size: 100, color: Colors.white)
                  : ClipOval(
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            SizedBox(height: 20),
            Text(
              'Select your Avatar',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              'We have a set of customizable avatars. Or you can upload your own image from your local file.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 20),
            // Row for avatar selection (You can add multiple avatar options here)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: avatars.map((avatarPath) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _image = null; // Reset custom upload if avatar is selected
                    });
                    _navigateToHome(); // After selecting, navigate to homepage
                  },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatarPath), // Avatar image
                    radius: 40,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: _pickImage, // Trigger image picker
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 40),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Or upload your profile',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _image != null ? _navigateToHome : null, // Navigate only if an image is selected
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4D3C2C),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Continue', style: TextStyle(fontSize: 18)),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

