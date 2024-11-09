# svm_server.py
from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

# Load the SVM model
with open('svm.pkl', 'rb') as f:
    svm_model = pickle.load(f)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()

    # Extract features from JSON (replace with the actual keys from your model)
    features = [
        data["age"],
        data["gender"],
        data["healthGoal"],
        data["mood"],
        data["physicalPain"],
        data["sleep"],
        data["stress"],
        data["weight"],
        data["previousHelp"]
    ]

    # Convert to NumPy array and reshape for model prediction
    features = np.array(features).reshape(1, -1)
    prediction = svm_model.predict(features)

    return jsonify({"prediction": prediction[0]})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)


import 'package:flutter/material.dart';
import 'svm_model.dart';

class ResultPage extends StatelessWidget {
  final SVMModel svmModel;

  ResultPage({required this.svmModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prediction Result")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String result = await svmModel.getPrediction();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text("Prediction: $result"),
              ),
            );
          },
          child: Text("Get Prediction"),
        ),
      ),
    );
  }
}
