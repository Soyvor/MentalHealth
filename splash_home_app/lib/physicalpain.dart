import 'package:flutter/material.dart';
import 'package:splash_home_app/home_page.dart';
import 'package:splash_home_app/sleep.dart';
import 'home_page.dart'; // Make sure to import your sleep.dart file

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AssessmentPage(),
    );
  }
}

class AssessmentPage extends StatefulWidget {
  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  String selectedOption = '';

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
              'Are you experiencing any physical distress?',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = 'yes';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedOption == 'yes' ? Colors.green : Colors.brown[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Yes, one or multiple',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(
                      selectedOption == 'yes' ? Icons.check_circle : Icons.circle_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = 'no';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedOption == 'no' ? Colors.green : Colors.brown[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No Physical Pain At All',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Icon(
                      selectedOption == 'no' ? Icons.check_circle : Icons.circle_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SleepPage()),
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
}
