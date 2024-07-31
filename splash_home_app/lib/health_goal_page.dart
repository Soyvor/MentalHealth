import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'gender_selection_page.dart';

class HealthGoalPage extends StatefulWidget {
  const HealthGoalPage({Key? key}) : super(key: key);

  @override
  _HealthGoalPageState createState() => _HealthGoalPageState();
}

class _HealthGoalPageState extends State<HealthGoalPage> {
  String? _selectedOption;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between children
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white), // Back button icon
                    onPressed: () {
                      Navigator.of(context).pop(); // Navigate backward
                    },
                  ),
                  Text(
                    'Assessment 1',
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontWeight: FontWeight.w500, // Medium weight
                      fontSize: 20.sp,
                      color: Colors.white, // Text color
                    ),
                  ),
                  SizedBox(width: 48.w), // Add space on the right to keep the title centered
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "What’s your health goal for today?",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProductSans',
                  color: Colors.white, // Text color
                ),
              ),
              SizedBox(height: 20.h),
              ..._buildOptions(),
              Spacer(),
              Container(
                width: 343.w,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: _selectedOption != null ? () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const GenderSelectionPage()),
                    );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 170, 83, 29), // Button color
                    padding: EdgeInsets.zero, // Remove extra padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1234), // Rounded corners
                    ),
                    textStyle: TextStyle(
                      fontFamily: 'ProductSans',
                      fontSize: 16.sp,
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOptions() {
    final options = [
      {'text': 'I wanna reduce stress', 'icon': Icons.favorite},
      {'text': 'I wanna know my analytics', 'icon': Icons.analytics},
      {'text': 'I want to be a better person', 'icon': Icons.sentiment_satisfied},
      {'text': 'I want to watch some good resources', 'icon': Icons.video_library},
    ];

    return options.map((option) {
      final isSelected = _selectedOption == option['text'];
      return Padding(
        padding: EdgeInsets.only(bottom: 16.h), // Padding between buttons
        child: GestureDetector(
          onTap: () {
            setState(() {
              _selectedOption = option['text'] as String;
            });
          },
          child: Container(
            width: 343.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF9BB168) : Color.fromARGB(57, 238, 238, 238),
              borderRadius: BorderRadius.circular(1234), // Rounded corners
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w), // Padding around icon
                  child: Icon(
                    option['icon'] as IconData, // Correctly cast the icon data
                    color: Colors.white, // Icon color
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      option['text'] as String,
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 16.sp,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
