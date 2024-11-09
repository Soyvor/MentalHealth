import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mood_selection_page.dart'; // Import the MoodSelectionPage

class WeightSelectionPage extends StatefulWidget {
  const WeightSelectionPage({super.key, required int score});

  @override
  _WeightSelectionPageState createState() => _WeightSelectionPageState();
}

class _WeightSelectionPageState extends State<WeightSelectionPage> {
  double _currentWeight = 128; // Default weight value
  bool? isKgSelected; // Set to null initially to indicate no selection
  int _score = 0; // Variable to store the calculated score

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Scaffold(
      backgroundColor: const Color(0xFF251404),
      appBar: AppBar(
        backgroundColor: const Color(0xFF251404),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Assessment', style: TextStyle(color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '4 of 14',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "What's your weight?",
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWeightUnitButton('kg', isKgSelected == true),
                _buildWeightUnitButton('lbs', isKgSelected == false),
              ],
            ),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                _currentWeight.toStringAsFixed(0) + (isKgSelected == true ? ' kg' : ' lbs'),
                style: TextStyle(
                  fontSize: 80.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFF9BB168),
                inactiveTrackColor: Colors.brown.shade600,
                thumbColor: const Color(0xFF9BB168),
                overlayColor: Colors.brown.shade700.withOpacity(0.2),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 28),
              ),
              child: Slider(
                value: _currentWeight,
                min: 40,
                max: 200,
                divisions: 160, // Each kg is a step
                onChanged: (double value) {
                  setState(() {
                    _currentWeight = value;
                  });
                },
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                  backgroundColor: Colors.brown.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  if (isKgSelected != null) {
                    // Calculate the score based on weight
                    _calculateScore();

                    // Navigate to the Mood Selection Page, passing the score
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoodSelectionPage(score: _score),
                      ),
                    );
                  } else {
                    // Show a message if no unit is selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select kg or lbs before continuing."),
                      ),
                    );
                  }
                },
                child: Text(
                  "Continue →",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  // Weight unit selection button builder
  Widget _buildWeightUnitButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isKgSelected = (text == 'kg');
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.brown.shade700,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Calculate the score based on weight
  void _calculateScore() {
    if (isKgSelected == true) {
      if (_currentWeight >= 60 && _currentWeight <= 80) {
        _score = 10; // Higher score for 60-80 kg range
      } else {
        _score = 5; // Lower score for other weights
      }
    } else {
      // Convert lbs to kg for comparison (1 lb = 0.453592 kg)
      double weightInKg = _currentWeight * 0.453592;
      if (weightInKg >= 60 && weightInKg <= 80) {
        _score = 10; // Higher score for 60-80 kg range
      } else {
        _score = 5; // Lower score for other weights
      }
    }
  }
}
