import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyPage extends StatelessWidget {
  final List<Map<String, String>> playlists = [
    {
      "title": "Mental health awareness (Playlist)",
      "channel": "Ted-Ed",
      "url": "https://open.spotify.com/playlist/37i9dQZF1DWZd79rJ6a7lp",
      "thumbnail":
          "https://i.scdn.co/image/ab67706f00000002cd17d41419faa97069e06c16",
      "duration": "18 Videos"
    },
    // Add more playlists here if needed
  ];

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: Text('Music Can Change How We Feel'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final playlist = playlists[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              color: Colors.brown[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    playlist["thumbnail"]!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  playlist["title"]!,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playlist["channel"]!,
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      playlist["duration"]!,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.play_arrow, color: Colors.green),
                  onPressed: () => _launchURL(playlist["url"]!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
