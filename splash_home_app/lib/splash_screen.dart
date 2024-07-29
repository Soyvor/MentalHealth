import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: const Size(360, 690));

    // Navigate to Home Page after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page')),
      );
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200, // Replace with your theme color
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/close.png', // Replace with your image path
                fit: BoxFit.cover, // Ensures image covers the whole screen
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80.h), // Increased height by 10 pixels
                    Text(
                      'Nexushive',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
