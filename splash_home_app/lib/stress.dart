import 'package:flutter/material.dart';
import 'package:splash_home_app/home_page.dart';
import 'package:splash_home_app/write.dart';

class StressPage extends StatefulWidget {
  @override
  _StressPageState createState() => _StressPageState();
}

class _StressPageState extends State<StressPage> {
  double stressLevel = 5; // Default value representing "Extremely Stressed Out"

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
        title: Text('Assessment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'How would you rate your stress level?',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              '${stressLevel.toInt()}',
              style: TextStyle(fontSize: 64, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
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
            SizedBox(height: 10),
            Text(
              getStressMessage(),
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WritePage()),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
