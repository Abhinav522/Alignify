import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WeightProgressScreen extends StatefulWidget {
  const WeightProgressScreen({Key? key}) : super(key: key);

  @override
  _WeightProgressScreenState createState() => _WeightProgressScreenState();
}

class _WeightProgressScreenState extends State<WeightProgressScreen> {
  double latestWeight = 0.0; // Variable to store the latest weight
  double desiredWeight = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchLatestWeight(); // Fetch the latest weight when the widget initializes
    _fetchDesiredWeight();
  }

  Future<void> _fetchLatestWeight() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final weightSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('bmiData')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

      if (weightSnapshot.docs.isNotEmpty) {
        final latestWeightDoc = weightSnapshot.docs.first;
        final latestWeightValue = latestWeightDoc['weight'] as int; // Change to double
        print('latest Weight Retrieved: $latestWeightValue');
        setState(() {
          latestWeight = latestWeightValue.toDouble();
        });
      }
    } catch (e) {
      print('Error fetching latest weight: $e');
    }
  }

  Future<void> _fetchDesiredWeight() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        final userData = userSnapshot.data() as Map<String, dynamic>;
        final desiredWeightValue = userData['desired_weight'] as int; // Change to double
        print('Desired Weight Retrieved: $desiredWeightValue');
        setState(() {
          desiredWeight = desiredWeightValue.toDouble();
        });
      }
    } catch (e) {
      print('Error fetching desired weight: $e');
    }
  }

  Widget _buildWeightProgressIndicator(double latestWeight, double desiredWeight) {
  // Ensure desiredWeight is not zero to prevent division by zero
  if (desiredWeight == 0) {
    return const Text(
      'Desired weight is not set',
      style: TextStyle(color: Colors.white),
    );
  }

  // Calculate progress percentage
  double progress = latestWeight / desiredWeight;

  // Calculate the color based on conditions
  Color color;
  if (latestWeight == desiredWeight) {
    color = Colors.green;
  } else if ((latestWeight - desiredWeight).abs() <= 2) {
    color = Colors.yellow;
  } else {
    color = Colors.red;
  }

  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          // Outer circle
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!),
            ),
          ),
          // Inner filled circle based on progress
          SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              value: progress.isFinite ? progress : 0, // Check if progress is finite
              strokeWidth: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          // Text indicating weight value
          Positioned(
            child: Text(
              latestWeight.toString(),
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Goal: $desiredWeight',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20),
          Text(
            'Current: $latestWeight',
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'BodyWeight Tracking',
          style: TextStyle(color: Color(0xFF40D876)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display circular progress indicator
              _buildWeightProgressIndicator(latestWeight, desiredWeight),
            ],
          ),
        ),
      ),
    );
  }
}
