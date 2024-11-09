import 'package:flutter/material.dart';
import 'package:splash_home_app/ResourcePage.dart'; // Import ResourcePage
import 'package:splash_home_app/doctors.dart';
import 'package:splash_home_app/main.dart';
import 'package:splash_home_app/spotify.dart'; // Import SpotifyPage
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math'; // Import to use random number generation

class StressScorePage extends StatelessWidget {
  final int score;

  // Add a constructor to receive the score
  StressScorePage({required this.score});

  @override
  Widget build(BuildContext context) {
    // Define random generator
    final random = Random();

    // Determine note based on score range
    String note = '';

    if (score < 40) {
      note = 'Please Have a chat with a close friend or family, or meet a doctor at your earliest.';
    } else if (score >= 50 && score < 60) {
      List<String> suggestions = [
        'Suggest trying a better sleeping routine and better diet.',
        'Reduce your stress by listening to some of our resources.',
        'Ever tried going out on your own and just walk some mile alone? It would make your day.'
      ];
      note = suggestions[random.nextInt(suggestions.length)];
    } else if (score >= 60 && score < 70) {
      List<String> suggestions = [
        'A good score but can get better, try eating fruits and relaxing a bit.',
        'Just reduce your stress by changing routine a bit.',
        'Try playing with pets, you are already above 78% Happy faces.'
      ];
      note = suggestions[random.nextInt(suggestions.length)];
    } else if (score > 75) {
      List<String> suggestions = [
        'Woah you are an extrovert I see? Really good work.',
        'Fun fact, only 12% people are actually relaxed today, better catch up to them.',
        'Weather can really affect your mood, try Meditation and you are good to go.',
        'Just stop overthinking, rest you are good to go!!'
      ];
      note = suggestions[random.nextInt(suggestions.length)];
    }

    return WillPopScope(
      onWillPop: () async => false, // Prevent back navigation
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Stress Score",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF251404),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFF251404),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Score display
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF9BB168),
                ),
              ),
              const Text(
                '/100',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9BB168),
                ),
              ),
              const SizedBox(height: 10),

              // Note below the score
              Text(
                note,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // Redirect to ResourcePage
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoListPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF0000),
                  minimumSize: const Size(400, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.youtube,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Check My Resources',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5D3C),
                  minimumSize: const Size(400, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Get Connected To doctors online',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Spacer(),

              // "Need Calm Sleep" button to navigate to SpotifyPage
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SpotifyPage()), // Navigate to SpotifyPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DB954), // Spotify Green color
                  minimumSize: const Size(400, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.spotify,
                      color: Colors.black,
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Need Calm Sleep',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
                child: const Text(
                  'Want to restart again?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
