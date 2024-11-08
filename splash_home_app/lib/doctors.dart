import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://img.freepik.com/premium-vector/vector-illustration-doctor-avatar-photo-doctor-fill-out-questionnaire-banner-set-more-doctor-health-medical-icon_469123-417.jpg?semt=ais_hybrid" // Stock avatar URL
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://img.freepik.com/premium-vector/vector-illustration-doctor-avatar-photo-doctor-fill-out-questionnaire-banner-set-more-doctor-health-medical-icon_469123-417.jpg?semt=ais_hybrid" // Stock avatar URL
    },
    {
      "name": "Dr. Emma Williams",
      "clinicNumber": "555-123-4567",
      "address": "789 Care Blvd, SF",
      "avatar": "https://media.istockphoto.com/id/2077095666/vector/default-placeholder-doctor-portrait-photo-avatar-on-gray-background-greyscale-healthcare.jpg?s=612x612&w=0&k=20&c=en2o7NAtzp_udRQhckeWozkwHiXGz5KCRhTzY3Vbhdo="
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://img.freepik.com/premium-vector/vector-illustration-doctor-avatar-photo-doctor-fill-out-questionnaire-banner-set-more-doctor-health-medical-icon_469123-417.jpg?semt=ais_hybrid" // Stock avatar URL
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://img.freepik.com/premium-vector/vector-illustration-doctor-avatar-photo-doctor-fill-out-questionnaire-banner-set-more-doctor-health-medical-icon_469123-417.jpg?semt=ais_hybrid" // Stock avatar URL
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://img.freepik.com/premium-vector/vector-illustration-doctor-avatar-photo-doctor-fill-out-questionnaire-banner-set-more-doctor-health-medical-icon_469123-417.jpg?semt=ais_hybrid" // Stock avatar URL
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://www.shutterstock.com/image-vector/female-doctor-avatar-african-american-600nw-1901708815.jpg" // Stock avatar URL
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://img.freepik.com/premium-vector/vector-illustration-doctor-avatar-photo-doctor-fill-out-questionnaire-banner-set-more-doctor-health-medical-icon_469123-417.jpg?semt=ais_hybrid" // Stock avatar URL
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://www.shutterstock.com/image-vector/female-doctor-avatar-african-american-600nw-1901708815.jpg" // Stock avatar URL
    },
    {
      "name": "Dr. M B Pethe",
      "clinicNumber": "123-456-7890",
      "address": "123 Health St, NY",
      "avatar": "https://www.shutterstock.com/image-vector/female-doctor-avatar-african-american-600nw-1901708815.jpg" // Stock avatar URL
    },
    // Add more doctors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
        backgroundColor: Color(0xFF251404), // Dark brown color
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement any action when the button is pressed, like navigating to a detail page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B5D3C), // Button color
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
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
            );
          },
        ),
      ),
    );
  }
}
