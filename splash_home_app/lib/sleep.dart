import 'package:flutter/material.dart';
import 'package:splash_home_app/stress.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key, required this.score}); // Receive score in the constructor

  final int score; // Declare score to be passed from the previous page

  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  double sliderValue = 2; // Default value representing "Poor"
  int totalScore = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the total score with the score passed from the previous page
    totalScore = widget.score;
  }

  void _calculateScore() {
    if (sliderValue == 0) {
      totalScore += 10; // Excellent
    } else if (sliderValue == 1) {
      totalScore += 8; // Good
    } else if (sliderValue == 2) {
      totalScore += 6; // Fair
    } else if (sliderValue == 3) {
      totalScore += 4; // Poor
    } else if (sliderValue == 4) {
      totalScore += 2; // Worst
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
              'How would you rate your sleep quality?',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Row(
                children: [
                  // Labels on the left side
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sleepQualityLabel('Excellent', '7-9 HOURS'),
                      sleepQualityLabel('Good', '6-7 HOURS'),
                      sleepQualityLabel('Fair', '5 HOURS'),
                      sleepQualityLabel('Poor', '3-4 HOURS'),
                      sleepQualityLabel('Worst', '<3 HOURS'),
                    ],
                  ),
                  const SizedBox(width: 10),
                  // Vertical slider using RotatedBox
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 3, // Rotates the slider to a vertical orientation
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 8.0,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
                        ),
                        child: Slider(
                          value: sliderValue,
                          min: 0,
                          max: 4,
                          divisions: 4,
                          activeColor: Colors.orange,
                          inactiveColor: Colors.brown[700],
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Emojis on the right side
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sleepEmoji(Icons.sentiment_very_satisfied, Colors.green),
                      sleepEmoji(Icons.sentiment_satisfied, Colors.yellow),
                      sleepEmoji(Icons.sentiment_neutral, Colors.grey),
                      sleepEmoji(Icons.sentiment_dissatisfied, Colors.orange),
                      sleepEmoji(Icons.sentiment_very_dissatisfied, Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateScore(); // Calculate the total score

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StressPage(score: totalScore), // Pass the score to the next page
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

  Widget sleepQualityLabel(String label, String hours) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          hours,
          style: const TextStyle(fontSize: 14, color: Colors.white54),
        ),
      ],
    );
  }

  Widget sleepEmoji(IconData icon, Color color) {
    return Icon(
      icon,
      color: color,
      size: 30,
    );
  }
}
