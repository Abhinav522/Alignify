import 'package:alignify/screens/bmi/result_bmi.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 60;
  int age = 18;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Color(0xFF40D876)),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      //body: const result_BMI(age:22, isMale:true, result:32.44,),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded('male'),
                    const SizedBox(
                      width: 15,
                    ),
                    m1Expanded('female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(1),
                              style: const TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text(
                              ' cm',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Slider(
                          min: 90,
                          max: 220,
                          value: heightVal,
                          onChanged: (newValue) =>
                              setState(() => heightVal = newValue),
                        ),
                      ],
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded('weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    m2Expanded('age'),
                  ],
                ),
              ),
            ),
            Container(
                color: const Color(0xFF40D876),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightVal / 100, 2);
                    _saveBMIData(result);
                    // print(result);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ResultBMI(
                          age: age,
                          isMale: isMale,
                          result: result,
                        );
                      }),
                    );
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // Function to save BMI data to Firestore
  void _saveBMIData(double result) async {
    try {
      // Check if a user is signed in
      User? user = _auth.currentUser;
      if (user != null) {
        String userId = user.uid; // Get the user ID

        // Get current timestamp
        Timestamp timestamp = Timestamp.now();

        // Save BMI data to Firestore with the user ID
        await _firestore.collection('users').doc(userId).collection('bmiData').add({
          'timestamp': timestamp,
          'bmi': result,
          'weight': weight,
          'height': heightVal,
        });

        // // Navigate to BMI result screen
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return ResultBMI(
        //       age: age,
        //       isMale: isMale,
        //       result: result,
        //     );
        //   }),
        // );
      }
    } catch (e) {
      print('Error saving BMI data: $e');
    }
  }


  Expanded m1Expanded(String gender) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = gender == 'male' ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (isMale && gender == 'male') || (!isMale && gender == 'female')
              ? const Color(0xFF40D876)
              : Colors.white24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gender == 'male' ? Icons.male : Icons.female,
              color: Colors.white,
              size: 90,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              gender == 'male' ? 'Male' : 'Female',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    ));
  }

  Expanded m2Expanded(String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'age' ? 'Age' : 'Weight',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            type == 'age' ? '$age' : '$weight',
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == 'age' ? 'age--' : 'weight--',
                onPressed: () =>
                    setState(() => type == 'age' ? age-- : weight--),
                mini: true,
                backgroundColor: const Color(0xFF40D876),
                child: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                heroTag: type == 'age' ? 'age++' : 'weight++',
                onPressed: () =>
                    setState(() => type == 'age' ? age++ : weight++),
                mini: true,
                backgroundColor: const Color(0xFF40D876),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

/*class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI SCREEN"),
      ),
      body: Container(),
    );
  }
}*/
