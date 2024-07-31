import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'splash_screen.dart';
import 'home_page.dart';
import 'info_page.dart';
import 'health_goal_page.dart';
import 'gender_selection_page.dart';
import 'age_selection_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Product Sans', // Use the Product Sans font
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const InfoScreens()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 2),
          builder: (context, double opacity, child) {
            return Opacity(
              opacity: opacity,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 36.sp, // Adjust the size as needed
                    color: Colors.white, // Default text color
                  ),
                  children: [
                    TextSpan(
                      text: 'N',
                      style: TextStyle(color: Color(0xFF4285F4)), // Color for N
                    ),
                    TextSpan(
                      text: 'e',
                      style: TextStyle(color: Color(0xFFDB4437)), // Color for E
                    ),
                    TextSpan(
                      text: 'x',
                      style: TextStyle(color: Color(0xFFF4B400)), // Color for X
                    ),
                    TextSpan(
                      text: 'u',
                      style: TextStyle(color: Color(0xFF4285F4)), // Color for U
                    ),
                    TextSpan(
                      text: 's',
                      style: TextStyle(color: Color(0xFF0F9D58)), // Color for S
                    ),
                    TextSpan(
                      text: 'Hive.',
                      style: TextStyle(
                        color: Colors.white, // Color for HIVE.
                        fontWeight: FontWeight.bold,
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

class InfoScreens extends StatefulWidget {
  const InfoScreens({Key? key}) : super(key: key);

  @override
  _InfoScreensState createState() => _InfoScreensState();
}

class _InfoScreensState extends State<InfoScreens> {
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'svgPath': 'assets/images/Welcome Screen.svg',
    },
    {
      'svgPath': 'assets/images/Welcome Screen-1.svg',
    },
    {
      'svgPath': 'assets/images/Welcome Screen-2.svg',
    },
    {
      'svgPath': 'assets/images/Welcome Screen-3.svg',
    },
  ];

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HealthGoalPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InfoPage(
      svgPath: _pages[_currentIndex]['svgPath']!,
      isLastPage: _currentIndex == _pages.length - 1,
      onNext: _nextPage,
    );
  }
}
