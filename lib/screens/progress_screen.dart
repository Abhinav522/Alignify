import 'package:flutter/material.dart';
import 'bmi/bmi_chart.dart';
import 'weight_progress.dart';
import 'exercise_listview.dart';
import 'exercise_recommendation.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    super.initState();
    //  _fetchLatestWeight(); // Fetch the latest weight when the widget initializes
    //_fetchDesiredWeight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Wrap the BMI charts with a SizedBox to provide constraints
                SizedBox(
                  height:
                      400, // Set a fixed height or use other constraints as needed
                  child: const BMIDataChart(), // Display the first BMI chart
                ),
                SizedBox(height: 20), // Add some space between charts
                SizedBox(
                  height:
                      400, // Set a fixed height or use other constraints as needed
                  child:
                      const BMIDataChart(), // Display the second BMI chart (for testing)
                ),
                // You can add more charts here as required
                SizedBox(
                  height:
                      300, // Set a fixed height or use other constraints as needed
                  child:
                      WeightProgressScreen(), // Display the second BMI chart (for testing)
                ),
                SizedBox(height: 20),
                SizedBox(
                  height:
                      500, // Set a fixed height or use other constraints as needed
                  child:
                      ExerciseListView(), // Display the second BMI chart (for testing)
                ),
                SizedBox(height: 20),
                SizedBox(
                  height:
                      700, // Set a fixed height or use other constraints as needed
                  child:
                      ExerciseRecommenderPage(), // Display the second BMI chart (for testing)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
