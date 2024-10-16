import 'package:flutter/material.dart';
import 'package:splash_home_app/home_page.dart';
import 'package:splash_home_app/stress.dart';

class SleepPage extends StatefulWidget {
  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  double sliderValue = 2; // Default value representing "Poor"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        title: Text('Assessment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'How would you rate your sleep quality?',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
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
                  SizedBox(width: 10),
                  // Vertical slider using RotatedBox
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 3, // Rotates the slider to a vertical orientation
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 8.0,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
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
                  SizedBox(width: 10),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StressPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
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
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          hours,
          style: TextStyle(fontSize: 14, color: Colors.white54),
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
