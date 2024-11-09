import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyPage extends StatelessWidget {
  final List<Map<String, String>> playlists = [
    {
      "title": "Sleep Playlist",
      "channel": "Only tunes , no vocals",
      "url": "https://open.spotify.com/playlist/37i9dQZF1DWZd79rJ6a7lp",
      "thumbnail":
          "https://i.scdn.co/image/ab67706f00000002f6cc01e86b401bd7f39dc290", 
      "duration": "22"
    },
    {
      "title": "Peaceful Piano Playlist",
      "channel": "Calming",
      "url": "https://open.spotify.com/playlist/37i9dQZF1DX4sWSpwq3LiO",
      "thumbnail":
          "https://i.scdn.co/image/ab67706f0000000283da657fca565320e9311863", 
      "duration": "53"
    },
    {
      "title": "Lofi Beats",
      "channel": "For sleep",
      "url": "https://open.spotify.com/playlist/37i9dQZF1DWWQRwui0ExPn",
      "thumbnail":
          "https://i.ytimg.com/vi/uLNwl5Zi8_I/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLADb7iHGh-5V8PFFkAghRlhm7l71w", 
      "duration": "45"
    },
    {
      "title": "Workout Beats",
      "channel": "Heavy , Gym",
      "url": "https://open.spotify.com/playlist/37i9dQZF1DXe6bgV3TmZOL",
      "thumbnail":
          "https://i.ytimg.com/vi/aF1dCCfjCBY/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBgPqgUyoUiy1TcQRMNYsTAauZqxw", 
      "duration": "45"
    },
    // 
    // Add more playlists as needed
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spotify Playlists',
          style: TextStyle(color: Colors.white), // Set title text color to white
        ),
        backgroundColor: Color(0xFF251404), // Dark brown color
      ),
      backgroundColor: Color(0xFF251404),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            var playlist = playlists[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () => _launchURL(playlist['url']!),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5D3C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: [
                            Image.network(
                              playlist['thumbnail']!,
                              width: 100,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: Container(
                                color: Colors.black54,
                                padding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: Text(
                                  playlist['duration']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playlist['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4), // Space between title and channel name
                            Text(
                              playlist['channel']!,
                              style: TextStyle(
                                color: Colors.white70, // Slightly faded for channel name
                                fontSize: 12, // Smaller font size for channel name
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
          },
        ),
      ),
    );
  }
}
