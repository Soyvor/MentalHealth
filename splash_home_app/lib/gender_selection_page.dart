import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'age_selection_page.dart'; // Make sure this page can accept the score

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({super.key});

  @override
  _GenderSelectionPageState createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  String? _selectedGender;
  int _score = 0; // Initialize the score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF251404), // Background color
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white), // Back button icon
                    onPressed: () {
                      Navigator.of(context).pop(); // Navigate backward
                    },
                  ),
                  SizedBox(width: 10.w), // Space between back button and text
                  Text(
                    'Gender Selection',
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontWeight: FontWeight.w500, // Medium weight
                      fontSize: 20.sp,
                      color: Colors.white, // Text color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "Select your gender:",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProductSans',
                  color: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20.h),
              _buildGenderOptions(),
              const Spacer(),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Update the score based on the selection
                      if (_selectedGender == 'Male') {
                        _score += 5;
                      } else if (_selectedGender == 'Female') {
                        _score += 3;
                      } else {
                        _score += 0;
                      }

                      // Navigate to the next page and pass the score
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AgeSelectionPage(score: _score), // Pass the score to AgeSelectionPage
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button color
                      minimumSize: Size(343.w, 56.h), // Button size
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h), // Space between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Handle the skip action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Button color
                      minimumSize: Size(343.w, 56.h), // Button size
                    ),
                    child: const Text(
                      'Prefer to skip',
                      style: TextStyle(
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOptions() {
    final options = ['Male', 'Female'];

    return Column(
      children: options.map((option) {
        final isSelected = _selectedGender == option;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedGender = option;
            });
          },
          child: Container(
            width: 343.w,
            height: 56.h, // Updated height
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF9BB168) : const Color.fromARGB(57, 238, 238, 238), // Background color
              borderRadius: BorderRadius.circular(100), // Rounded corners
            ),
            child: Center(
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
