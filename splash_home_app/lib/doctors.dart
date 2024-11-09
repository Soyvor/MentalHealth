import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorsPage extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr Pankaj Borade - Mind Matters Clinic",
      "clinicNumber": "Office no. 510, 10th Floor, Antariksh Towers, Station",
      "address": "Camp, Pune",
      "avatar": "https://imagesx.practo.com/providers/dr-pankaj-b-borade-psychiatrist-pune-364e8dec-ecc8-47c5-bb39-2eeaab0e8852.jpg?i_type=t_70x70",
      "url": "https://www.practo.com/pune/clinic/atharva-clinic-nibm-1"
    },
    {
      "name": "Dr. Kishor Jadhavar",
      "clinicNumber": "14 Years Experience Overall  (10 years as specialist)",
      "address": "Office Number 504, 5th Floor Mundhwa Railway Bridge, Pune",
      "avatar": "https://imagesx.practo.com/providers/dr-kishor-jadhavar-psychiatrist-pune-182bb15b-4916-467e-8081-d4eb1f1a0d84.jpg?i_type=t_70x70",
      "url": "https://www.practo.com/pune/doctor/dr-kishor-v-jadhavar-psychiatrist?practice_id=1427046&specialization=Psychiatrist&referrer=doctor_listing&page_uid=915769a7-b01b-4ac9-b7f3-0895edea9d21"
    },
    {
      "name": "Dr. Ruth Fernandes",
      "clinicNumber": "19 Years Experience Overall  (18 years as specialist)",
      "address": "789 Care Blvd, SF21, 3rd floor, B wing, City VIsta building, Fountain road., Landmark:",
      "avatar": "https://imagesx.practo.com/providers/dr-ruth-fernandes-psychiatrist-pune-e1311a36-2bb3-4670-af70-b8fa77e8bebe.jpg?i_type=t_70x70",
      "url": "https://www.practo.com/pune/doctor/ruth-fernandes-psychiatrist?practice_id=1240912&specialization=Psychiatrist&referrer=doctor_listing&page_uid=915769a7-b01b-4ac9-b7f3-0895edea9d21"
    },
    // Add more doctors as needed
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
          'Doctors List',
          style: TextStyle(color: Colors.white), // Set title text color to white
        ),
        backgroundColor: Color(0xFF251404), // Dark brown color
      ),
      backgroundColor: Color(0xFF251404),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () => _launchURL(doctor['url']!),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF8B5D3C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(doctor['avatar']!),
                        backgroundColor: Colors.grey[300], // Placeholder color if image fails
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor['name']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Clinic Number: ${doctor['clinicNumber']!}",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              doctor['address']!,
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 12,
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
