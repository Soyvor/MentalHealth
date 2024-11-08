import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoListPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      "title": "Mental health awareness (Playlist)",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/playlist?list=PLJicmE8fK0EgFqcHoA4ufzsPD6VQThV5S",
      "thumbnail":
          "https://i.ytimg.com/vi/z-IR48Mb3W0/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLC1vTrBgRWpO-j5Ur2SxKSmDSO8GQ", 
      "duration": "18 Videos"
    },
    {
      "title": "Does stress affect your memory? - Elizabeth Cox",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/watch?v=hyg7lcU4g8E&list=PLJicmE8fK0EgFqcHoA4ufzsPD6VQThV5S&index=7",
      "thumbnail":
          "https://i.ytimg.com/vi/hyg7lcU4g8E/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDXgqxaDYNRN-AORsTttFC2ezLYMg", 
      "duration": "4:43"
    },
    {
      "title": "What causes panic attacks, and how can you prevent them? - Cindy J. Aaronson",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/watch?v=IzFObkVRSV0&list=PLJicmE8fK0EgFqcHoA4ufzsPD6VQThV5S&index=10",
      "thumbnail":
          "https://i.ytimg.com/vi/IzFObkVRSV0/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDNTuSdWru6L4GkA9IIT3TQzIK2Bw", 
      "duration": "15:22"
    },
    {
      "title": "Calm your anxiety in 2 minutes!",
      "channel": "Rachel Richards Massage",
      "url": "https://www.youtube.com/watch?v=5zhnLG3GW-8",
      "thumbnail":
          "https://i.ytimg.com/vi/5zhnLG3GW-8/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDOmtc8xHikD_q9ISueVfePJu37CQ", 
      "duration": "2:14"
    },
    {
      "title": "How To Deal With Anxiety | Buddhism In English",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/watch?v=nnSRJ5PRPWQ",
      "thumbnail":
          "https://i.ytimg.com/an_webp/nnSRJ5PRPWQ/mqdefault_6s.webp?du=3000&sqp=COTkubkG&rs=AOn4CLByCOWVzy_vFmavvW6Pa_O-NlP83Q", 
      "duration": "12:08"
    },
    {
      "title": "What causes panic attacks, and how can you prevent them? - Cindy J. Aaronson",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/watch?v=IzFObkVRSV0&list=PLJicmE8fK0EgFqcHoA4ufzsPD6VQThV5S&index=10",
      "thumbnail":
          "https://i.ytimg.com/vi/IzFObkVRSV0/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDNTuSdWru6L4GkA9IIT3TQzIK2Bw", 
      "duration": "15:22"
    },
    {
      "title": "What causes panic attacks, and how can you prevent them? - Cindy J. Aaronson",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/watch?v=IzFObkVRSV0&list=PLJicmE8fK0EgFqcHoA4ufzsPD6VQThV5S&index=10",
      "thumbnail":
          "https://i.ytimg.com/vi/IzFObkVRSV0/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDNTuSdWru6L4GkA9IIT3TQzIK2Bw", 
      "duration": "15:22"
    },
    {
      "title": "What causes panic attacks, and how can you prevent them? - Cindy J. Aaronson",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/watch?v=IzFObkVRSV0&list=PLJicmE8fK0EgFqcHoA4ufzsPD6VQThV5S&index=10",
      "thumbnail":
          "https://i.ytimg.com/vi/IzFObkVRSV0/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDNTuSdWru6L4GkA9IIT3TQzIK2Bw", 
      "duration": "15:22"
    },
    {
      "title": "What causes panic attacks, and how can you prevent them? - Cindy J. Aaronson",
      "channel": "Ted-Ed",
      "url": "https://www.youtube.com/watch?v=IzFObkVRSV0&list=PLJicmE8fK0EgFqcHoA4ufzsPD6VQThV5S&index=10",
      "thumbnail":
          "https://i.ytimg.com/vi/IzFObkVRSV0/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDNTuSdWru6L4GkA9IIT3TQzIK2Bw", 
      "duration": "15:22"
    },
    // Add more videos as needed
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
          'Let\'s see what we have here',
          style: TextStyle(color: Colors.white), // Set title text color to white
        ),
        backgroundColor: Color(0xFF251404), // Dark brown color
      ),
      backgroundColor: Color(0xFF251404),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            var video = videos[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () => _launchURL(video['url']!),
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
                              video['thumbnail']!,
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
                                  video['duration']!,
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
                              video['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4), // Space between title and channel name
                            Text(
                              video['channel']!,
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
