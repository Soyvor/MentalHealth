import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoPage extends StatelessWidget {
  final String svgPath;
  final bool isLastPage;
  final VoidCallback onNext;

  const InfoPage({
    Key? key,
    required this.svgPath,
    required this.isLastPage,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: SvgPicture.asset(
              svgPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: const Color.fromARGB(255, 15, 157, 88),
                    width: 4.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  textStyle: TextStyle(
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w800, // Medium weight
                    fontSize: 24.sp, // Adjust size as needed
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 24.w,
                  ),
                ),
                onPressed: onNext,
                child: Text(
                  isLastPage ? 'Get Started' : 'Next',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w500, // Medium weight
                    fontSize: 16.sp, // Adjust size as needed
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
