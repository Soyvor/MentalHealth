import 'package:flutter/material.dart';
import 'package:splash_home_app/avatar.dart'; // Ensure AvatarPage is imported
import 'package:splash_home_app/home_page.dart';

class WritePage extends StatefulWidget {
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  TextEditingController _textController = TextEditingController();
  int stressLevel = 0;

  // List of sad, upsetting, and suicidal words
  final List<String> negativeWords = [
    "sad", "depressed", "kill", "die", "suicidal", "upset", "worthless", "hopeless", "alive anymore", "f***", "death"
  ];

  void analyzeText() {
    String input = _textController.text.toLowerCase();
    int count = 0;

    // Count the number of negative words in the text
    for (String word in negativeWords) {
      if (input.contains(word)) {
        count++;
      }
    }

    // Determine stress level based on count
    setState(() {
      stressLevel = count;
    });

    // Debug output
    print('Input: $input');
    print('Negative word count: $count');
    print('Stress Level: $stressLevel');

    // Navigate to AvatarPage if stress level is greater than 0
    if (stressLevel > 0) {
      try {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AvatarPage()),
        );
      } catch (e) {
        print('Error navigating to AvatarPage: $e');
      }
    } else {
      // Optional: Show a message if no stress detected
      print('No stress detected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4D3C2C), // Background color
      appBar: AppBar(
        backgroundColor: Color(0xFF4D3C2C), // Matches background
        elevation: 0, // Remove shadow
        title: Text('Expression Analysis', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Freely write down anything that\'s on your mind. nexus is here to listen...',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF3E2F20), // Darker background for the text field
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    maxLines: 5,
                    style: TextStyle(color: Colors.white), // Text color
                    decoration: InputDecoration(
                      hintText: "Write here",
                      hintStyle: TextStyle(color: Colors.grey), // Hint text color
                      border: InputBorder.none, // Remove default borders
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${_textController.text.length}/250',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: analyzeText,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4D3C2C),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Implement your voice input logic here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF8BC34A), // Green color for voice button
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mic, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Use voice Instead', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (stressLevel > 0)
              Text(
                'Stress Level Detected: $stressLevel',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
