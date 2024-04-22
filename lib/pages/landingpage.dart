import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import Flutter SVG package
import 'package:project3/widget/navbar.dart' as CustomNavBar;
import 'package:project3/widget/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _videoNames = [
    'Budgeting made easy: Introduction to budgeting',
    'Another Video Title',
  ];
  List<double> _weeklyProgress = [0.3, 0.5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom styled navigation bar
          Container(
            decoration: BoxDecoration(
              color: Colors.amber, // Change the background color to amber
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Changes the shadow position
                ),
              ],
            ),
            child: CustomNavBar.NavigationBar(), // Use CustomNavBar.NavigationBar as the app bar
          ),

          // Row for sidebar and main content
          Expanded(
            child: Row(
              children: [
                // Sidebar
                Container(
                  width: 200, // Fixed width for the sidebar
                  color: Colors.grey[200],
                  child: SideBar(), // Use the SideBar widget
                ),
                // Column for main content
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        // Chatbot image and text
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Chatbot image
                            Container(
                              width: 181,
                              height: 136,
                              child: SvgPicture.asset(
                                'assets/chatbot.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            // Chatbot text and progress placeholder
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Chatbot text
                                  Container(
                                    width: 300,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Hi, I am Mira',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(height: 5), // Reduced gap here
                                  Container(
                                    width: 300,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'here to answer all your Questions',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            // Progress placeholder
                            _buildWeeklyProgressGraph(),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Text field and button
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 91,
                              width: 711,
                              
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                              child: Text('Get Answer'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Video placeholders
                        _buildVideoPlaceholders(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build progress bar graph
  Widget _buildWeeklyProgressGraph() {
    return Container(
      width: 362,
      height: 249,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < _weeklyProgress.length; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 200 *
                              _weeklyProgress[
                                  i], // Adjust the height based on progress value
                          color: Colors.blue, // Change color based on progress
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Week ${i + 1}', // Week number as label
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Progress',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  // Method to build video placeholders
  Widget _buildVideoPlaceholders() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'My Learning',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: _videoNames.map((_) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                child: Container(
                  width: 336,
                  height: 250,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      _,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'All Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Container(
                    width: 336,
                    height: 250,
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        'Placeholder Video ${i + 1}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
