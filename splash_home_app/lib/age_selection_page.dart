import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';

class AgeSelectionPage extends StatefulWidget {
  const AgeSelectionPage({Key? key}) : super(key: key);

  @override
  _AgeSelectionPageState createState() => _AgeSelectionPageState();
}

class _AgeSelectionPageState extends State<AgeSelectionPage> {
  final TextEditingController _ageController = TextEditingController();
  bool _isValidAge = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF251404), // Background color
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacer to push title a few pixels down from the top
            SizedBox(height: 40.h), // Adjust this value to move the title further down
            Text(
              "Select or enter your age:",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSans',
                color: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 20.h), // Space between title and age picker
            _buildAgePicker(context),
            if (!_isValidAge)
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  'Not eligible to use this app, prefer parent\'s authority before continuing',
                  style: TextStyle(color: Color.fromARGB(255, 69, 122, 41), fontSize: 16.sp),
                ),
              ),
            Spacer(),
            ElevatedButton(
              onPressed: _isValidAge ? () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page')),
                );
              } : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Button color
                minimumSize: Size(343.w, 56.h), // Button size
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white, // Text color
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
        style: TextStyle(
          color: Colors.white, // Text color inside the TextField
          fontFamily: 'ProductSans',
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your age',
          labelStyle: TextStyle(
            fontFamily: 'ProductSans',
            color: Colors.white, // Color of the label text
          ),
        ),
        onChanged: (value) {
          setState(() {
            final age = int.tryParse(value);
            _isValidAge = age != null && age >= 18 && age<100;
          });
        },
      ),
    );
  }
}
