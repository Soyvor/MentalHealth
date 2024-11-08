import 'package:flutter/material.dart';
import 'sleep.dart';
import 'home_page.dart'; // Make sure to import your sleep.dart file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AssessmentPage(score: 0,),
    );
  }
}

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key, required int score});

  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  String selectedOption = '';
  int score = 0; // Score variable to track the score

  // Function to update score based on the selected option
  void updateScore() {
    if (selectedOption == 'yes') {
      score += 10; // +10 for Yes
    } else if (selectedOption == 'no') {
      score += 5; // +5 for No
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        title: const Text('Assessment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Are you experiencing any physical distress?',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = 'yes';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedOption == 'yes'
                      ? Colors.green
                      : Colors.brown[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Yes, one or multiple',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(
                      selectedOption == 'yes'
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = 'no';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selectedOption == 'no' ? Colors.green : Colors.brown[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'No Physical Pain At All',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(
                      selectedOption == 'no'
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                updateScore(); // Update score when continue is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SleepPage(score: score), // Pass the score to the next page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
