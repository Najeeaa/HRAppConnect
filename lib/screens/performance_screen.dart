import 'package:flutter/material.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({Key? key}) : super(key: key);

  @override
  _PerformanceScreenState createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  final List<Map<String, dynamic>> performanceReviews = [];
  final TextEditingController employeeController = TextEditingController();
  double rating = 3;
  final TextEditingController feedbackController = TextEditingController();

  void addPerformanceReview() {
    if (employeeController.text.isNotEmpty && feedbackController.text.isNotEmpty) {
      setState(() {
        performanceReviews.add({
          "name": employeeController.text,
          "rating": rating,
          "feedback": feedbackController.text,
        });
        employeeController.clear();
        feedbackController.clear();
        rating = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Performance Reviews")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: employeeController,
              decoration: InputDecoration(labelText: "Employee Name"),
            ),
          ),
          Slider(
            value: rating,
            min: 1,
            max: 5,
            divisions: 4,
            label: "${rating.round()} Stars",
            onChanged: (double value) {
              setState(() {
                rating = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: feedbackController,
              decoration: InputDecoration(labelText: "Feedback"),
            ),
          ),
          ElevatedButton(onPressed: addPerformanceReview, child: Text("Submit Review")),
          Expanded(
            child: ListView.builder(
              itemCount: performanceReviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${performanceReviews[index]["name"]} - ${performanceReviews[index]["rating"]} Stars"),
                  subtitle: Text("Feedback: ${performanceReviews[index]["feedback"]}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}