import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_home_app/previoushelp.dart';

class MoodSelectionPage extends StatefulWidget {
  const MoodSelectionPage(
      {super.key, required this.score}); // Receive score from previous page

  final int score;

  @override
  _MoodSelectionPageState createState() => _MoodSelectionPageState();
}

class _MoodSelectionPageState extends State<MoodSelectionPage> {
  int _selectedMood = 2; // Default mood index (Neutral)
  late int currentScore;

  final List<String> moodDescriptions = [
    "I Feel Sad.",
    "I Feel Anxious.",
    "I Feel Neutral.",
    "I Feel Happy.",
    "I Feel Excited."
  ];

  final List<IconData> moodIcons = [
    Icons.sentiment_very_dissatisfied, // Sad
    Icons.sentiment_dissatisfied, // Anxious
    Icons.sentiment_neutral, // Neutral
    Icons.sentiment_satisfied, // Happy
    Icons.sentiment_very_satisfied // Excited
  ];

  final List<Color> moodColors = [
    Colors.blue, // Sad (cooler color)
    Colors.orange, // Anxious (warmer color)
    Colors.grey, // Neutral
    Colors.lightGreen, // Happy (calmer color)
    Colors.yellow, // Excited (bright color)
  ];

  @override
  void initState() {
    super.initState();
    currentScore = widget.score; // Initialize score passed from previous page
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PreviousHelpPage(score: currentScore), // Passing the score
              ),
            );
          },
        ),
        title: const Text('Assessment', style: TextStyle(color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '5 of 14',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Text(
                "How would you describe your mood?",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                moodDescriptions[_selectedMood],
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30.h),
              Icon(
                moodIcons[_selectedMood],
                size: 100.sp,
                color: moodColors[_selectedMood],
              ),
              SizedBox(height: 20.h),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 30.h),
              _buildMoodArc(),
              SizedBox(height: 20.h), // Add some spacing above the button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                    backgroundColor: Colors.brown.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    // Calculate score based on mood
                    int moodScore = _calculateMoodScore();

                    // Add the mood score to the previous score
                    currentScore += moodScore;

                    // Navigate to PreviousHelpPage and pass the updated score
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreviousHelpPage(
                            score: currentScore), // Pass the updated score
                      ),
                    );
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
      ),
    );
  }

  // Function to build the arc mood selector
  Widget _buildMoodArc() {
    return SizedBox(
      height: 200.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Mood arc with the various faces
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: Size(300.w, 150.h),
              painter: ArcPainter(),
            ),
          ),
          // Mood buttons (5 different moods)
          for (int i = 0; i < moodIcons.length; i++)
            Positioned(
              bottom: 10.h +
                  (i % 2 == 0
                      ? 0
                      : 10.h), // Alternating positions for arc effect
              left: i * 60.w, // Spread the icons evenly
              child: GestureDetector(
                onTap: () => setState(() => _selectedMood = i),
                child: _buildMoodIcon(moodIcons[i], i),
              ),
            ),
        ],
      ),
    );
  }

  // Widget for each mood icon
  Widget _buildMoodIcon(IconData icon, int index) {
    return Icon(
      icon,
      size: 50.sp,
      color: _selectedMood == index ? moodColors[index] : Colors.brown.shade600,
    );
  }

  // Function to calculate mood score based on the selected mood
  int _calculateMoodScore() {
    switch (_selectedMood) {
      case 0: // Sad
        return 1; // Lower score for sad mood
      case 1: // Anxious
        return 2; // Slightly higher score for anxious mood
      case 2: // Neutral
        return 3; // Neutral mood score
      case 3: // Happy
        return 4; // Higher score for happy mood
      case 4: // Excited
        return 5; // Highest score for excited mood
      default:
        return 0; // Default case (should never happen)
    }
  }
}

// CustomPainter for the arc slider background
class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.brown.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50;

    final path = Path();
    path.arcTo(
      Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: 150),
      3.14, // Start angle (π radians or 180 degrees)
      3.14, // Sweep angle (π radians or 180 degrees)
      false,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
