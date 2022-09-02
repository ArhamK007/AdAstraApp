import 'package:firebase_attempt/central%20screens/game%20screens/matching%20tiles/matching_tiles_info.dart';
import 'package:firebase_attempt/central%20screens/game%20screens/quiz%20style/quiz_screen.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/allTopics.dart';
import 'package:firebase_attempt/central%20screens/nav%20bar%20routes/explore_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

import '../../main_page.dart';
import '../game screens/matching tiles/matching_tiles_g1.dart';

class SelectionTiles extends StatelessWidget {
  static int index = 0;
  static String topic = "";
  SelectionTiles(int screenIndex) {
    index = screenIndex;
  }

  static List likedTopics = [];

  static List vr_section = [
    "Matching Tiles",
    "Letter Codes",
    "Word Codes",
    "Number Sequences",
    "Word Connections",
    "Missing Letter",
    "Missing Number",
    "Make A Word From Another Word",
    "Match the Codes",
    "Make a Word",
    "Word and Letter Patterns Practice",
    "Synonyms",
    "Antonyms",
    "Analogies",
    "Odd One Out",
    "Vocabulary Practice",
    "Shuffled Sentences",
    "Move a Letter",
    "Missing Three Letters",
    "Spot the Word",
    "Join Two Words to Make One",
    "Spelling Practice",
    "Letters for Numbers",
    "Number Connections",
    "Number Patterns Practice",
    "Days and Dates",
    "Time",
    "Position",
    "Sorting Information",
    "True Statements",
    "Problem Solving Practice",
  ];
  //final List routes = [HiddenDrawer(), null, null, null];
  //final List routes = [MatchingTilesGame1(), null, null, null];
  final List vr_routes = [
    InformationSheet(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
  ];

  static List nvr_section = [
    "Odd One Out",
    "Practice Quiz",
    "Series",
    "Similarities",
    "Analogies",
    "Hidden Shapes",
    "Matricies",
    "Reflected Shapes",
    "Nets of Cubes",
    "Codes",
    "Combined Shapes"
  ];

  final List nvr_routes = [
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
    QuizScreen(),
  ];

  static List numeracy_section = [
    "Fractions",
    "Quick Maths",
    "Algebra",
    "Shapes"
  ];
  final List numeracy_routes = [null, QuizScreen(), null, null];

  void showLike(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            title: Center(child: Text("Added to Liked")),
          );
        });
  }

  Widget VRScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MainPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Icon(Icons.logout)),
            ),
            Text(
              "VR Activities",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => AllTopics(),
                        transition: Transition.topLevel,
                        duration: Duration(seconds: 1));
                  },
                  child: Icon(Icons.list)),
            ),

            // IconButton(
            //     icon: Icon(Icons.list), onPressed: () => Get.to(AllTopics())),
          ],
        ),
        // Text(
        //   "VR Activities",
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 28,
        //   ),
        // ),
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: GestureDetector(
          //       onTap: () {
          //         Get.to(AllTopics());
          //       },
          //       child: Icon(Icons.list)),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: GestureDetector(
          //       onTap: () {
          //         FirebaseAuth.instance.signOut();
          //         Navigator.pushAndRemoveUntil(
          //           context,
          //           MaterialPageRoute(
          //             builder: (BuildContext context) => MainPage(),
          //           ),
          //           (route) => false,
          //         );
          //       },
          //       child: Icon(Icons.logout)),
          // ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        //itemCount: vr_section.length,
        itemCount: vr_section.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
                  child: GestureDetector(
                    onTap: () {
                      topic = vr_section[index];
                      print(topic);
                      //old navigation below -> works perf
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => vr_routes[index]));
                      Widget screen = vr_routes[index]; //allows for transitions

                      if (topic == "Matching Tiles") {
                        screen = InformationSheet();
                      } else {
                        screen = QuizScreen();
                      }

                      Get.to(() => screen,
                          //transition: Transition.topLevel,
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 750));
                    },
                    onDoubleTap: () {
                      topic = vr_section[index];
                      if (ExplorePage.index == 0) {
                        SelectionTiles.likedTopics.add(topic + " - VR");
                      } else if (ExplorePage.index == 1) {
                        SelectionTiles.likedTopics.add(topic + " - NVR");
                      } else if (ExplorePage.index == 2) {
                        SelectionTiles.likedTopics.add(topic + " - Numeracy");
                      }
                      showLike(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white10),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('lib/assets/VR3.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        //height: 100,
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                vr_section[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            //Image.asset('lib/assets/adastralogo.jpg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //Icon(Icons.next_plan)
              // ElevatedButton(
              //     onPressed: () => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HiddenDrawer())),
              //     child: Text("")),
            ],
          );
        }),

        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Center(
        //         child: Text(
        //       "Currently being made...",
        //       style: TextStyle(
        //         fontSize: 26.0,
        //       ),
        //     )),
        //     Center(
        //       child: Lottie.network(
        //           "https://assets8.lottiefiles.com/private_files/lf30_y9czxcb9.json"),
        //     ),
        //     SizedBox(
        //       height: 150,
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HiddenDrawer()));
        //         },
        //         child: Text("Go To Content!"))
        //   ],
        // ),
      ),
    );
  }

  Widget NVRScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MainPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Icon(Icons.logout)),
            ),
            Text(
              "NVR Activities",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => AllTopics(),
                        transition: Transition.topLevel,
                        duration: Duration(seconds: 1));
                  },
                  child: Icon(Icons.list)),
            ),

            // IconButton(
            //     icon: Icon(Icons.list), onPressed: () => Get.to(AllTopics())),
          ],
        ),
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: GestureDetector(
          //       onTap: () {
          //         Get.to(AllTopics());
          //       },
          //       child: Icon(Icons.list)),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: GestureDetector(
          //       onTap: () {
          //         FirebaseAuth.instance.signOut();
          //         Navigator.pushAndRemoveUntil(
          //           context,
          //           MaterialPageRoute(
          //             builder: (BuildContext context) => MainPage(),
          //           ),
          //           (route) => false,
          //         );
          //       },
          //       child: Icon(Icons.logout)),
          // ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        //itemCount: nvr_section.length,
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
                  child: GestureDetector(
                    onTap: () {
                      topic = nvr_section[index];
                      print(topic);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => nvr_routes[index]));
                      Widget screen = nvr_routes[index];
                      Get.to(() => screen,
                          //transition: Transition.topLevel,
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 750));
                    },
                    onDoubleTap: () {
                      topic = vr_section[index];
                      if (ExplorePage.index == 0) {
                        SelectionTiles.likedTopics.add(topic + " - VR");
                      } else if (ExplorePage.index == 1) {
                        SelectionTiles.likedTopics.add(topic + " - NVR");
                      } else if (ExplorePage.index == 2) {
                        SelectionTiles.likedTopics.add(topic + " - Numeracy");
                      }
                      showLike(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white10),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('lib/assets/NVR.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        //height: 100,
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                nvr_section[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            //Image.asset('lib/assets/adastralogo.jpg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HiddenDrawer())),
              //     child: Text("")),
            ],
          );
        }),

        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Center(
        //         child: Text(
        //       "Currently being made...",
        //       style: TextStyle(
        //         fontSize: 26.0,
        //       ),
        //     )),
        //     Center(
        //       child: Lottie.network(
        //           "https://assets8.lottiefiles.com/private_files/lf30_y9czxcb9.json"),
        //     ),
        //     SizedBox(
        //       height: 150,
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HiddenDrawer()));
        //         },
        //         child: Text("Go To Content!"))
        //   ],
        // ),
      ),
    );
  }

  Widget NumeracyScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MainPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Icon(Icons.logout)),
            ),
            Text(
              "Numeracy Activities",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Get.to(() => AllTopics(),
                        transition: Transition.topLevel,
                        duration: Duration(seconds: 1));
                  },
                  child: Icon(Icons.list)),
            ),

            // IconButton(
            //     icon: Icon(Icons.list), onPressed: () => Get.to(AllTopics())),
          ],
        ),
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: GestureDetector(
          //       onTap: () {
          //         Get.to(AllTopics());
          //       },
          //       child: Icon(Icons.list)),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: GestureDetector(
          //       onTap: () {
          //         FirebaseAuth.instance.signOut();
          //         Navigator.pushAndRemoveUntil(
          //           context,
          //           MaterialPageRoute(
          //             builder: (BuildContext context) => MainPage(),
          //           ),
          //           (route) => false,
          //         );
          //       },
          //       child: Icon(Icons.logout)),
          // ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        //itemCount: numeracy_section.length,
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
                  child: GestureDetector(
                    onTap: () {
                      topic = numeracy_section[index];
                      print(topic);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => numeracy_routes[index]));
                      Widget screen = numeracy_routes[index];
                      Get.to(() => screen,
                          //transition: Transition.topLevel,
                          transition: Transition.upToDown,
                          duration: Duration(milliseconds: 750));
                    },
                    onDoubleTap: () {
                      topic = vr_section[index];
                      if (ExplorePage.index == 0) {
                        SelectionTiles.likedTopics.add(topic + " - VR");
                      } else if (ExplorePage.index == 1) {
                        SelectionTiles.likedTopics.add(topic + " - NVR");
                      } else if (ExplorePage.index == 2) {
                        SelectionTiles.likedTopics.add(topic + " - Numeracy");
                      }
                      showLike(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white10),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('lib/assets/numeracy2.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        //height: 100,
                        width: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                numeracy_section[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            //Image.asset('lib/assets/adastralogo.jpg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => HiddenDrawer())),
              //     child: Text("")),
            ],
          );
        }),

        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Center(
        //         child: Text(
        //       "Currently being made...",
        //       style: TextStyle(
        //         fontSize: 26.0,
        //       ),
        //     )),
        //     Center(
        //       child: Lottie.network(
        //           "https://assets8.lottiefiles.com/private_files/lf30_y9czxcb9.json"),
        //     ),
        //     SizedBox(
        //       height: 150,
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HiddenDrawer()));
        //         },
        //         child: Text("Go To Content!"))
        //   ],
        // ),
      ),
    );
  }

  // void showScreen(BuildContext context) async {
  //   index = await Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => ExplorePage()));
  // }

  @override
  Widget build(BuildContext context) {
    final List activityScreen = [
      VRScreen(context),
      NVRScreen(context),
      NumeracyScreen(context)
    ];
    //print("activity screen index $index");
    return activityScreen[ExplorePage.index];

    // return Scaffold(
    //   backgroundColor: Colors.blue[200],
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: Text(
    //       "VR Activities",
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontWeight: FontWeight.bold,
    //         fontSize: 28,
    //       ),
    //     ),
    //     backgroundColor: Colors.blue[200],
    //     elevation: 0.0,
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: GestureDetector(
    //             onTap: () {
    //               FirebaseAuth.instance.signOut();
    //               Navigator.pushAndRemoveUntil(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (BuildContext context) => MainPage(),
    //                 ),
    //                 (route) => false,
    //               );
    //             },
    //             child: Icon(Icons.logout)),
    //       ),
    //     ],
    //   ),
    //   body: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: section.length,
    //     itemBuilder: ((context, index) {
    //       return Column(
    //         children: [
    //           Expanded(
    //             child: Padding(
    //               padding: const EdgeInsets.fromLTRB(8, 25, 4, 10),
    //               child: GestureDetector(
    //                 onTap: () => Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => routes[index])),
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       color: Colors.grey[300],
    //                       border: Border.all(color: Colors.white10),
    //                       borderRadius: BorderRadius.circular(30),
    //                       image: DecorationImage(
    //                         image: AssetImage('lib/assets/VR3.jpg'),
    //                         fit: BoxFit.fill,
    //                       ),
    //                     ),
    //                     //height: 100,
    //                     width: 300,
    //                     child: Column(
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.all(20.0),
    //                           child: Text(
    //                             section[index],
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(
    //                               fontSize: 24.0,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 30,
    //                         ),

    //                         //Image.asset('lib/assets/adastralogo.jpg'),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           // ElevatedButton(
    //           //     onPressed: () => Navigator.push(
    //           //         context,
    //           //         MaterialPageRoute(
    //           //             builder: (context) => HiddenDrawer())),
    //           //     child: Text("")),
    //         ],
    //       );
    //     }),

    //     // body: Column(
    //     //   mainAxisAlignment: MainAxisAlignment.center,
    //     //   children: [
    //     //     Center(
    //     //         child: Text(
    //     //       "Currently being made...",
    //     //       style: TextStyle(
    //     //         fontSize: 26.0,
    //     //       ),
    //     //     )),
    //     //     Center(
    //     //       child: Lottie.network(
    //     //           "https://assets8.lottiefiles.com/private_files/lf30_y9czxcb9.json"),
    //     //     ),
    //     //     SizedBox(
    //     //       height: 150,
    //     //     ),
    //     //     ElevatedButton(
    //     //         onPressed: () {
    //     //           Navigator.push(context,
    //     //               MaterialPageRoute(builder: (context) => HiddenDrawer()));
    //     //         },
    //     //         child: Text("Go To Content!"))
    //     //   ],
    //     // ),
    //   ),
    // );
  }
}
