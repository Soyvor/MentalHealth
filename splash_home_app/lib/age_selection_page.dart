import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_home_app/weight.dart';

class AgeSelectionPage extends StatefulWidget {
  final int score;

  const AgeSelectionPage({super.key, required this.score});

  @override
  _AgeSelectionPageState createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  final TextEditingController _ageController = TextEditingController();
  bool _isValidAge = false; // Set to false initially to prevent navigation
  int _currentScore = 0;

  @override
  void initState() {
    super.initState();
    _currentScore = widget.score; // Initialize score from the previous page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF251404), // Background color
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Text(
              "Select or enter your age:",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSans',
                color: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 20.h),
            _buildAgePicker(context),
            if (!_isValidAge)
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  'Not eligible to use this app, prefer parent\'s authority before continuing',
                  style: TextStyle(color: const Color.fromARGB(255, 69, 122, 41), fontSize: 16.sp),
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: _isValidAge ? () {
                // Update score based on age
                final age = int.tryParse(_ageController.text);
                if (age != null) {
                  if (age < 18) {
                    _currentScore += 0; // Age below 18, no score change
                  } else if (age >= 18 && age <= 30) {
                    _currentScore += 5; // Age between 18-30, score +5
                  } else {
                    _currentScore += 3; // Age above 30, score +3
                  }

                  // Navigate to next page with updated score
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WeightSelectionPage(score: _currentScore)),
                  );
                }
              } : null, // Disable button if age is not valid
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(343.w, 56.h),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ProductSans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgePicker(BuildContext context) {
    return Container(
      width: 343.w,
      height: 56.h,
      margin: EdgeInsets.only(bottom: 16.h),
      child: TextField(
        controller: _ageController,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'ProductSans',
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your age',
          labelStyle: TextStyle(
            fontFamily: 'ProductSans',
            color: Colors.white,
          ),
        ),
        onChanged: (value) {
          setState(() {
            final age = int.tryParse(value);
            _isValidAge = age != null && age >= 18 && age < 100;
          });
        },
      ),
    );
  }
}
