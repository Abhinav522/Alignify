class Exercise {
  final String name;
  final List<String> instructions;
  final String image;
  final String gif;
  final int trackedKeypoint;
  final int trackingDirection;
  final String formCorrectnessModel;
  final List<String> targetedMuscles;
  final List<String> cameraInstructions;

  Exercise({
    required this.name,
    required this.instructions,
    required this.image,
    required this.gif,
    required this.trackedKeypoint,
    required this.trackingDirection,
    required this.formCorrectnessModel,
    required this.targetedMuscles,
    required this.cameraInstructions,
  });
}

final Exercise pushUps = Exercise(
  name: 'Push Ups',
  instructions: [
    'Start in a plank position with your arms straight and your hands shoulder-width apart.',
    'Lower your body until your chest touches the floor.',
    'Push your body back up to the starting position.',
    'Repeat for the desired number of reps.'
  ],
  image: "assets/images/push_up.png",
  gif: 'assets/images/push_up.gif',
  trackedKeypoint: kKeypointDict['right_shoulder'] as int,
  trackingDirection: 0,
  formCorrectnessModel: 'models/pushUp_version2.tflite',
  targetedMuscles: ['Chest', 'Triceps', 'Shoulders'],
  cameraInstructions: [
    "For this exercise, you need to place your phone in a landscape orientation.",
    "While exercising, your phone needs to be in a stable position (i.e. not move).",
    "Your phone's camera should be able to view your entire body's right side, specially your right shoulder, since we use it to track your reps",
    "Start a warmup for 15 seconds. This is necessary for our AI to calculate some statistics off your body.",
    "Once you're done with your warmup, you should be able to start your workout",
    "Once you have started a set, you should perform the required number of reps",
    "When you're done, go back to your phone and start you rest period",
    "If you want to, you can always just finish your set early and take your rest. Remember, exercise is supposed to be fun!",
  ],
);

final Exercise pullUps = Exercise(
  name: 'Pull Ups',
  instructions: [
    'Start by grabbing the pull-up bar with your palms facing away from you and your hands shoulder-width apart.',
    'Hang from the bar with your arms extended and your feet off the ground.',
    'Pull your body up towards the bar until your chin is above the bar.',
    'Lower your body back down to the starting position.',
    'Repeat for the desired number of reps.'
  ],
  image: "assets/images/pull_up.png",
  gif: 'assets/images/pull_up.gif',
  trackedKeypoint: kKeypointDict['nose'] as int,
  trackingDirection: 1,
  formCorrectnessModel: 'models/pullUp.tflite',
  targetedMuscles: ['Back', 'Biceps', 'Shoulders'],
  cameraInstructions: [
    "For this exercise, you need to place your phone in a portrait orientation.",
    "While exercising, your phone needs to be in a stable position (i.e. not move).",
    "Your phone's camera should be able to view your entire body's anterior, specially your nose, since we use it to track your reps",
    "Start a warmup for 15 seconds. This is necessary for our AI to calculate some statistics off your body.",
    "Once you're done with your warmup, you should be able to start your workout",
    "Once you have started a set, you should perform the required number of reps",
    "When you're done, go back to your phone and start you rest period",
    "If you want to, you can always just finish your set early and take your rest. Remember, exercise is supposed to be fun!",
  ],
);

final Exercise squats = Exercise(
  name: 'Squats',
  instructions: [
    'Stand with your feet shoulder-width apart and your toes pointing slightly outward.',
    'Lower your body by bending your knees and pushing your hips back as if you are sitting on a chair.',
    'Keep your chest up and your back straight as you descend until your thighs are parallel to the ground.',
    'Push through your heels to return to the starting position.',
    'Repeat for the desired number of reps.'
  ],
  image: "assets/images/squat.jpg",
  gif: 'assets/images/squat.gif',
  trackedKeypoint: kKeypointDict['nose'] as int,
  trackingDirection: 1,
  formCorrectnessModel: 'models/squat.tflite',
  targetedMuscles: ['Quads', 'Hip Flexors', 'Hamstrings', 'Glutes'],
  cameraInstructions: [
    "For this exercise, you need to place your phone in a portrait orientation.",
    "While exercising, your phone needs to be in a stable position (i.e. not move).",
    "Your phone's camera should be able to view your entire body's anterior, specially your nose, since we use it to track your reps",
    "Start a warmup for 15 seconds. This is necessary for our AI to calculate some statistics off your body.",
    "Once you're done with your warmup, you should be able to start your workout",
    "Once you have started a set, you should perform the required number of reps",
    "When you're done, go back to your phone and start you rest period",
    "If you want to, you can always just finish your set early and take your rest. Remember, exercise is supposed to be fun!",
  ],
);

/// MoveNet Keypoints constants
const Map<String, int> kKeypointDict = {
  'nose': 0,
  'left_eye': 1,
  'right_eye': 2,
  'left_ear': 3,
  'right_ear': 4,
  'left_shoulder': 5,
  'right_shoulder': 6,
  'left_elbow': 7,
  'right_elbow': 8,
  'left_wrist': 9,
  'right_wrist': 10,
  'left_hip': 11,
  'right_hip': 12,
  'left_knee': 13,
  'right_knee': 14,
  'left_ankle': 15,
  'right_ankle': 16,
};
