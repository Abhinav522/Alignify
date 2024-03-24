import 'package:flutter/material.dart';

class ExerciseRecommenderPage extends StatefulWidget {
  @override
  _ExerciseRecommenderPageState createState() =>
      _ExerciseRecommenderPageState();
}

class _ExerciseRecommenderPageState extends State<ExerciseRecommenderPage> {
  String _selectedCategory = "Strength Training";
  List<String> _selectedMuscles = [];

  List<Map<String, dynamic>> exercises = [
    {
      "name": "Squats",
      "muscles": ["Quadriceps", "Glutes", "Hamstrings"],
      "category": "Strength Training"
    },
    {
      "name": "Deadlifts",
      "muscles": ["Hamstrings", "Glutes", "Lower Back"],
      "category": "Strength Training"
    },
    {
      "name": "Bench Press",
      "muscles": ["Chest", "Triceps", "Shoulders"],
      "category": "Strength Training"
    },
    {
      "name": "Pull-Ups",
      "muscles": ["Shoulders", "Biceps", "Upper Back"],
      "category": "Strength Training"
    },
    {
      "name": "Push-Ups",
      "muscles": ["Chest", "Shoulders", "Triceps"],
      "category": "Strength Training"
    },
    {
      "name": "Barbell Rows",
      "muscles": ["Upper Back", "Lats", "Biceps"],
      "category": "Strength Training"
    },
    {
      "name": "Lunges",
      "muscles": ["Quadriceps", "Glutes", "Hamstrings"],
      "category": "Strength Training"
    },
    {
      "name": "Shoulder Press",
      "muscles": ["Shoulders", "Triceps", "Chest"],
      "category": "Strength Training"
    },
    {
      "name": "Leg Press",
      "muscles": ["Quadriceps", "Glutes", "Hamstrings"],
      "category": "Strength Training"
    },
    {
      "name": "Bicep Curls",
      "muscles": ["Biceps", "Forearms", "Brachialis"],
      "category": "Strength Training"
    },
    {
      "name": "Tricep Dips",
      "muscles": ["Triceps", "Chest", "Shoulders"],
      "category": "Strength Training"
    },
    {
      "name": "Romanian Deadlifts",
      "muscles": ["Hamstrings", "Glutes", "Lower Back"],
      "category": "Strength Training"
    },
    {
      "name": "Russian Twists",
      "muscles": ["Obliques", "Core", "Abs"],
      "category": "Strength Training"
    },
    {
      "name": "Leg Extensions",
      "muscles": ["Quadriceps", "Quadriceps", "Quadriceps"],
      "category": "Strength Training"
    },
    {
      "name": "Planks",
      "muscles": ["Core", "Shoulders", "Lower Back"],
      "category": "Strength Training"
    },
    {
      "name": "Hamstring Curls",
      "muscles": ["Hamstrings", "Glutes", "Calves"],
      "category": "Strength Training"
    },
    {
      "name": "Barbell Hip Thrusts",
      "muscles": ["Glutes", "Hamstrings", "Lower Back"],
      "category": "Strength Training"
    },
    {
      "name": "Dumbbell Flyes",
      "muscles": ["Chest", "Shoulders", "Triceps"],
      "category": "Strength Training"
    },
    {
      "name": "Reverse Lunges",
      "muscles": ["Quadriceps", "Glutes", "Hamstrings"],
      "category": "Strength Training"
    },
    {
      "name": "Lat Pulldowns",
      "muscles": ["Shoulders", "Biceps", "Upper Back"],
      "category": "Strength Training"
    },
    {
      "name": "Tricep Kickbacks",
      "muscles": ["Triceps", "Shoulders", "Upper Back"],
      "category": "Strength Training"
    },
    {
      "name": "Dumbbell Shoulder Raises",
      "muscles": ["Shoulders", "Traps", "Triceps"],
      "category": "Strength Training"
    },
    {
      "name": "Front Squats",
      "muscles": ["Quadriceps", "Glutes", "Core"],
      "category": "Strength Training"
    },
    {
      "name": "Barbell Shrugs",
      "muscles": ["Trapezius", "Shoulders", "Upper Back"],
      "category": "Strength Training"
    },
    {
      "name": "Bent-Over Rows",
      "muscles": ["Upper Back", "Lats", "Biceps"],
      "category": "Strength Training"
    },
    {
      "name": "Hammer Curls",
      "muscles": ["Biceps", "Forearms", "Brachialis"],
      "category": "Strength Training"
    },
    {
      "name": "Dumbbell Lunges",
      "muscles": ["Quadriceps", "Glutes", "Hamstrings"],
      "category": "Strength Training"
    },
    {
      "name": "Leg Press Calf Raises",
      "muscles": ["Calves", "Quadriceps", "Hamstrings"],
      "category": "Strength Training"
    },
    {
      "name": "Lateral Raises",
      "muscles": ["Shoulders", "Traps", "Triceps"],
      "category": "Strength Training"
    },
    {
      "name": "Downward Facing Dog (Adho Mukha Svanasana)",
      "muscles": ["Shoulders", "Hamstrings", "Calves"],
      "category": "Yoga"
    },
    {
      "name": "Warrior I (Virabhadrasana I)",
      "muscles": ["Quadriceps", "Glutes", "Shoulders"],
      "category": "Yoga"
    },
    {
      "name": "Warrior II (Virabhadrasana II)",
      "muscles": ["Quadriceps", "Glutes", "Thighs"],
      "category": "Yoga"
    },
    {
      "name": "Plank Pose (Phalakasana)",
      "muscles": ["Core", "Shoulders", "Arms"],
      "category": "Yoga"
    },
    {
      "name": "Tree Pose (Vrikshasana)",
      "muscles": ["Core Stability", "Balance", "Hips"],
      "category": "Yoga"
    },
    {
      "name": "Bridge Pose (Setu Bandhasana)",
      "muscles": ["Glutes", "Hamstrings", "Lower Back"],
      "category": "Yoga"
    },
    {
      "name": "Cobra Pose (Bhujangasana)",
      "muscles": ["Back", "Shoulders", "Chest"],
      "category": "Yoga"
    },
    {
      "name": "Boat Pose (Navasana)",
      "muscles": ["Core", "Hip Flexors", "Lower Back"],
      "category": "Yoga"
    },
    {
      "name": "Chair Pose (Utkatasana)",
      "muscles": ["Quadriceps", "Glutes", "Core"],
      "category": "Yoga"
    },
    {
      "name": "Child's Pose (Balasana)",
      "muscles": ["Back", "Hips", "Thighs"],
      "category": "Yoga"
    },
    {
      "name": "Triangle Pose (Trikonasana)",
      "muscles": ["Hamstrings", "Thighs", "Shoulders"],
      "category": "Yoga"
    },
    {
      "name": "Extended Side Angle Pose (Utthita Parsvakonasana)",
      "muscles": ["Quadriceps", "Glutes", "Side Body"],
      "category": "Yoga"
    },
    {
      "name": "Seated Forward Bend (Paschimottanasana)",
      "muscles": ["Hamstrings", "Lower Back", "Shoulders"],
      "category": "Yoga"
    },
    {
      "name": "Upward Facing Dog (Urdhva Mukha Svanasana)",
      "muscles": ["Chest", "Shoulders", "Core"],
      "category": "Yoga"
    },
    {
      "name": "Four-Limbed Staff Pose (Chaturanga Dandasana)",
      "muscles": ["Shoulders", "Triceps", "Core"],
      "category": "Yoga"
    },
    {
      "name": "Low Lunge (Anjaneyasana)",
      "muscles": ["Hip Flexors", "Quadriceps", "Chest"],
      "category": "Yoga"
    },
    {
      "name": "Pigeon Pose (Eka Pada Rajakapotasana)",
      "muscles": ["Hip Flexors", "Glutes", "Lower Back"],
      "category": "Yoga"
    },
    {
      "name": "Half Moon Pose (Ardha Chandrasana)",
      "muscles": ["Core Stability", "Hip Abductors", "Hamstrings"],
      "category": "Yoga"
    },
    {
      "name": "Warrior III (Virabhadrasana III)",
      "muscles": ["Hamstrings", "Glutes", "Core"],
      "category": "Yoga"
    },
    {
      "name": "Garland Pose (Malasana)",
      "muscles": ["Quadriceps", "Groin", "Ankles"],
      "category": "Yoga"
    },
    {
      "name": "Fish Pose (Matsyasana)",
      "muscles": ["Chest", "Neck", "Throat"],
      "category": "Yoga"
    },
    {
      "name": "Locust Pose (Salabhasana)",
      "muscles": ["Back", "Glutes", "Hamstrings"],
      "category": "Yoga"
    },
    {
      "name": "Cow Pose (Bitilasana)",
      "muscles": ["Spine Flexibility", "Chest", "Abdominals"],
      "category": "Yoga"
    },
    {
      "name": "Cat Pose (Marjaryasana)",
      "muscles": ["Spine Flexibility", "Abdominals", "Shoulders"],
      "category": "Yoga"
    },
    {
      "name": "Extended Triangle Pose (Utthita Trikonasana)",
      "muscles": ["Hamstrings", "Thighs", "Shoulders"],
      "category": "Yoga"
    },
    {
      "name": "Revolved Triangle Pose (Parivrtta Trikonasana)",
      "muscles": ["Hamstrings", "Glutes", "Side Body"],
      "category": "Yoga"
    },
    {
      "name": "Camel Pose (Ustrasana)",
      "muscles": ["Quadriceps", "Hip Flexors", "Chest"],
      "category": "Yoga"
    },
    {
      "name": "Headstand (Sirsasana)",
      "muscles": ["Core", "Shoulders", "Arms"],
      "category": "Yoga"
    },
    {
      "name": "Tadasana",
      "muscles": ["Core", "Ankles", "Shoulders"],
      "category": "Yoga"
    },
  ];

  // Function to recommend top three exercises
List<String> recommendTopThreeExercises(String category, List<String> targetMuscles) {
  // Filter exercises based on category
  List<Map<String, dynamic>> filteredExercises = exercises
      .where((exercise) => exercise['category'] == category)
      .toList();

  // Initialize variables to track recommended exercises
  List<String> recommendedExercises = [];
  Map<String, int> exerciseScores = {};

  // Loop through filtered exercises
  for (var exercise in filteredExercises) {
    // Calculate score for each exercise based on matching muscles
    int score = 0;
    List<String> exerciseMuscles = List<String>.from(exercise['muscles']);
    for (var muscle in targetMuscles) {
      if (exerciseMuscles.contains(muscle)) {
        score++;
      }
    }

    // Update exercise scores
    exerciseScores[exercise['name']] = score;
  }

  // Sort exercises by score in descending order
  List<String> sortedExercises = exerciseScores.keys.toList()
    ..sort((a, b) => exerciseScores[b]!.compareTo(exerciseScores[a]!));

  // Recommend top three exercises
  for (int i = 0; i < sortedExercises.length && i < 3; i++) {
    recommendedExercises.add(sortedExercises[i]);
  }

  // Return recommended exercises
  return recommendedExercises;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Exercise Recommender"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Category:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: <String>["Strength Training", "Yoga"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Target Muscles:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                _buildMuscleChip("Quadriceps"),
                _buildMuscleChip("Glutes"),
                _buildMuscleChip("Hamstrings"),
                _buildMuscleChip("Lower Back"),
                _buildMuscleChip("Chest"),
                _buildMuscleChip("Triceps"),
                _buildMuscleChip("Shoulders"),
                _buildMuscleChip("Upper Back"),
                _buildMuscleChip("Lats"),
                _buildMuscleChip("Biceps"),
                _buildMuscleChip("Forearms"),
                _buildMuscleChip("Calves"),
                _buildMuscleChip("Core"),
                _buildMuscleChip("Traps"),
                _buildMuscleChip("Thighs"),
                _buildMuscleChip("Hips"),
                _buildMuscleChip("Ankles"),
                // Add more muscle chips here as per your dataset
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                List<String> recommendedExercises =
                  recommendTopThreeExercises(_selectedCategory, _selectedMuscles);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Recommended Exercise"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: recommendedExercises
                            .map((exercise) => Text(exercise))
                            .toList(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Recommend Exercise"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMuscleChip(String muscle) {
    return ChoiceChip(
      label: Text(muscle),
      selected: _selectedMuscles.contains(muscle),
      onSelected: (selected) {
        setState(() {
          if (selected) {
            _selectedMuscles.add(muscle);
          } else {
            _selectedMuscles.remove(muscle);
          }
        });
      },
    );
  }
}
