import 'package:flutter/material.dart';
import 'physicalpain.dart'; // Import your physicalpain.dart file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PreviousHelpPage(),
    );
  }
}

class PreviousHelpPage extends StatefulWidget {
  const PreviousHelpPage({super.key});

  @override
  _PreviousHelpPageState createState() => _PreviousHelpPageState();
}

class _PreviousHelpPageState extends State<PreviousHelpPage> {
  bool _hasSoughtHelp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          'Assessment',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '6 of 14',
                style: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Have you sought professional help before?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            // Add the illustration image here
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.brown[800],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, size: 150, color: Colors.orange),
              // Replace with the image widget as required
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Yes Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _hasSoughtHelp ? Colors.green : Colors.brown[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      _hasSoughtHelp = true;
                    });
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20),
                // No Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !_hasSoughtHelp ? Colors.brown[800] : Colors.brown[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      _hasSoughtHelp = false;
                    });
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // Navigate to PhysicalPainPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssessmentPage()),
                );
              },
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
