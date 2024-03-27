import 'package:alignify/screens/exercise_selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'nutrition_screen.dart';
import 'profile_screen.dart';
import 'progress_screen.dart';
import 'bmi/calculate_bmi.dart';
import '../utils/exercise.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  late List<Widget> _screens;
  late String _userId = '';

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    _fetchUserId();
    _screens = [
      HomeViewBody(userId: _userId),
      const BMI(),
      ProgressScreen(),
    ];
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  void _fetchUserId() {
    User? user = FirebaseAuth.instance.currentUser; // Get the current user
    if (user != null) {
      setState(() {
        _userId = user.uid; // Store the userID
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xFF40D876),
          buttonBackgroundColor: const Color(0xFF40D876),
          color: const Color(0xFF212121),
          onTap: _onItemTapped,
          items: const [
            Icon(
              Icons.home,
              color: Color(0xFFFAFAFA),
            ),
            Icon(
              Icons.calculate,
              color: Color(0xFFFAFAFA),
            ),
            Icon(
              Icons.bar_chart,
              color: Color(0xFFFAFAFA),
            ),
          ]),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _screens,
      ),
    );
  }
}

class HomeViewBody extends StatefulWidget {
  final String userId;

  const HomeViewBody({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // You can access userId using widget.userId
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          opacity: 0.5,
          image: AssetImage(
            "assets/images/image3.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Welcome to ",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 22,
                          color: Colors.white,
                          letterSpacing: 1.8,
                        ),
                      ),
                      Text(
                        "Alignify",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 32,
                          color: const Color(0xFF68B984),
                          letterSpacing: 1.8,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfileScreen(userId: widget.userId)),
                      );
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(
                          width: 3,
                          color: const Color(0xFF40D876),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.account_circle,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(height: 20),
            ),
            /*
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Find ",
                        style: GoogleFonts.lato(
                          fontSize: 26,
                          color: const Color(0xFF68B984),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "your Workout",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.sports,
                    size: 40,
                    color: Colors.white,
                  )
                ],
              ),
            ),*/
            /*
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 353,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF232441),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "SEARCH WORKOUT",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            */
            /*
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Popular",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NutritionScreen()));
                    },
                    child: Text(
                      "Nutrition",
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  /*
                  Text(
                    "Hard workout",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),*/
                  Text(
                    "Full body",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Crossfit",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            */
            Text(
              "Popular Workouts",
              style: GoogleFonts.lato(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height:20),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: availableExercises.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseSelectionScreen(
                                exercise: availableExercises[index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.black54,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 8, top: 8, bottom: 8),
                            child: CustomListTile(
                              exercise: availableExercises[index],
                            ),
                          ),
                        ),
                      ),
                    );
                    /*
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          catego[index].page));
                            },
                            child: Container(
                              height: 172,
                              width: 141,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(catego[index].imagUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            catego[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                    */
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Exercise exercise;

  const CustomListTile({
    required this.exercise,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      // padding: const EdgeInsets.all(4),
      child: Row(children: [
        Expanded(
          flex: 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(exercise.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 14,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                exercise.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: exercise.targetedMuscles.length,
                itemBuilder: (BuildContext context, int i) {
                  return Text(
                    "- ${exercise.targetedMuscles[i]}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}


// ListTile(
//   // contentPadding: EdgeInsets.zero,
//   leading: Container(
//     height: 172,
//     width: 141,
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage(catego[index].imageUrl),
//         fit: BoxFit.cover,
//       ),
//     ),
//   ),
//   title: Text(
//     catego[index].name,
//     style: const TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//       color: Colors.white,
//     ),
//   ),
//   subtitle: ListView.builder(
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     itemCount:
//         catego[index].exercise.targetedMuscles.length,
//     itemBuilder: (BuildContext context, int i) {
//       return Text(
//         "- ${catego[index].exercise.targetedMuscles[i]}",
//         style: const TextStyle(
//           fontSize: 16,
//           color: Colors.white70,
//         ),
//       );
//     },
//   ),
// )