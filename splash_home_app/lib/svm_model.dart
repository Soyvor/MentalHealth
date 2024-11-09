import 'dart:convert';
import 'package:http/http.dart' as http;

class SVMModel {
  // Map to store user inputs from different pages
  Map<String, dynamic> userData = {
    "age": null,
    "gender": null,
    "healthGoal": null,
    "mood": null,
    "physicalPain": null,
    "sleep": null,
    "stress": null,
    "weight": null,
    "previousHelp": null,
  };

  // Function to update user data
  void updateData(String key, dynamic value) {
    userData[key] = value;
  }

  // Function to send data to the SVM model and get the prediction
  Future<String> getPrediction() async {
    final url = Uri.parse("http://<your_server_address>/predict"); // Replace with your server URL
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return result["prediction"];
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
