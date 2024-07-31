import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: const Size(360, 690));

    // Navigate to Home Page after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page')),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(seconds: 2),
          builder: (context, double opacity, child) {
            return Opacity(
              opacity: opacity,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'ProductSans-Medium',
                    fontSize: 36.sp, // Base size for Nexus
                  ),
                  children: [
                    TextSpan(
                      text: 'N',
                      style: TextStyle(color: Color(0xFF4285F4)), // Color for N
                    ),
                    TextSpan(
                      text: 'E',
                      style: TextStyle(color: Color(0xFFDB4437)), // Color for E
                    ),
                    TextSpan(
                      text: 'X',
                      style: TextStyle(color: Color(0xFFF4B400)), // Color for X
                    ),
                    TextSpan(
                      text: 'U',
                      style: TextStyle(color: Color(0xFF4285F4)), // Color for U
                    ),
                    TextSpan(
                      text: 'S',
                      style: TextStyle(color: Color(0xFF0F9D58)), // Color for S
                    ),
                    TextSpan(
                      text: 'HIVE.',
                      style: TextStyle(
                        color: Colors.white, // Color for HIVE.
                        fontWeight: FontWeight.bold, // Bold font
                        fontSize: 48.sp, // Increased size for HIVE
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
