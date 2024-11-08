import 'package:flutter/material.dart';
import 'dart:math'; // Importing to use Random class
import 'package:splash_home_app/Scorepage.dart'; // Import the page for displaying the score

class StressPage extends StatefulWidget {
  const StressPage({super.key, required int score});

  @override
  _StressPageState createState() => _StressPageState();
}

class _StressPageState extends State<StressPage> {
  double stressLevel = 5; // Default value representing "Extremely Stressed Out"

  // Method to calculate a random score based on the stress level
  int calculateStressScore() {
    Random random = Random(); // Create a random number generator

    if (stressLevel == 0) {
      // If stress level is 0 (calm)
      return random.nextInt(10) + 78; // Random between 78 and 87
    } else if (stressLevel == 1 || stressLevel == 2) {
      // If stress level is 1 or 2 (slightly stressed)
      return random.nextInt(13) + 58; // Random between 58 and 70
    } else if (stressLevel == 3) {
      // If stress level is 3 (moderately stressed)
      return random.nextInt(10) + 46; // Random between 46 and 55
    } else {
      // If stress level is 4 or 5 (quite or extremely stressed)
      return random.nextInt(21) + 30; // Random between 30 and 50
    }
  }

  String getStressMessage() {
    switch (stressLevel.toInt()) {
      case 1:
        return 'You are Very Calm.';
      case 2:
        return 'You are Slightly Stressed.';
      case 3:
        return 'You are Moderately Stressed.';
      case 4:
        return 'You are Quite Stressed.';
      case 5:
        return 'You Are Extremely Stressed Out.';
      default:
        return '';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'How would you rate your stress level?',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Text(
              '${stressLevel.toInt()}',
              style: const TextStyle(fontSize: 64, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8.0,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
              ),
              child: Slider(
                value: stressLevel,
                min: 1,
                max: 5,
                divisions: 4,
                activeColor: Colors.orange,
                inactiveColor: Colors.brown[700],
                onChanged: (value) {
                  setState(() {
                    stressLevel = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              getStressMessage(),
              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Calculate the stress score
                int score = calculateStressScore();

                // Pass the score to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StressScorePage(score: score)),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
