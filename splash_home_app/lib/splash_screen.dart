import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
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

    return Scaffold(
      backgroundColor: Colors.grey.shade200, // Replace with your theme color
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height, // Ensure it covers the entire screen
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Transform.scale(
                scale: 0.7, // Scale the animation to 40% of its original size
                child: Lottie.asset(
                  'assets/animations/splash.json',
                ),
              ),
            ),
            Positioned(
              bottom: 50.h, // Adjust the position of the text as needed
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Nexushive',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color.fromARGB(255, 0, 0, 0), // Set text color to white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
