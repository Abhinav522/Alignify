import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExerciseListView extends StatefulWidget {
  const ExerciseListView({Key? key}) : super(key: key);

  @override
  _ExerciseListViewState createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView> {
  List<Map<String, dynamic>> exerciseData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchExerciseData();
  }

  Future<void> fetchExerciseData() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('exerciseData')
          .get();

      final List<Map<String, dynamic>> data = [];
      querySnapshot.docs.forEach((doc) {
        final exercise = doc.data();
        if (exercise != null) {
          data.add(exercise as Map<String, dynamic>);
        }
      });

      setState(() {
        exerciseData = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching exercise data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Exercise List', style: TextStyle(color: Color(0xFF40D876))),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : exerciseData.isEmpty
              ? Center(
                  child: Text(
                    'No exercises found.',
                    style: TextStyle(color: Color.fromARGB(255, 197, 17, 17)),
                  ),
                )
              : ListView.builder(
                  itemCount: exerciseData.length,
                  itemBuilder: (context, index) {
                    return ExerciseCard(exerciseData: exerciseData[index]);
                  },
                ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Map<String, dynamic> exerciseData;

  const ExerciseCard({required this.exerciseData});

  @override
  Widget build(BuildContext context) {
    final List<String> targetedMuscles =
        List<String>.from(exerciseData['targeted_muscles'] ?? []);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          exerciseData['exercise_name'] ?? 'Exercise Name',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: targetedMuscles
                .map((muscle) => Text(
                      muscle,
                      style: TextStyle(color: Color.fromARGB(255, 48, 50, 83)),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
