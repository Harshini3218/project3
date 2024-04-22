import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String _name = "Priyanka Singh"; // Replace with actual name
  String _class = "Class 10"; // Replace with actual class
  List<String> _buttons = [
    "Courses",
    "Activities",
    "Settings",
    "Inbox",
    "Help"
  ];
  List<IconData> _icons = [
    Icons.book,
    Icons.directions_run,
    Icons.settings,
    Icons.inbox,
    Icons.help
  ];
  int _selectedIndex = -1; // -1 indicates no button selected

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Adjust sidebar width as needed
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(
              'assets/studying girl.svg', // Replace 'assets/studying girl.png' with your image asset path
              width: 200,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 4), // Gap between name and class
          Text(
            _name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4), // Gap between name and class
          Text(
            _class,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Column(
            children: List.generate(_buttons.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  // Handle button tap
                },
                child: Container(
                  width: 265,
                  height: 48,
                  color: _selectedIndex == index
                      ? Colors.blue.withOpacity(0.2)
                      : Colors.transparent,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        _icons[index],
                        color: _selectedIndex == index
                            ? Color.fromARGB(255, 74, 37, 241)
                            : Colors.black,
                      ),
                      SizedBox(width: 10), // Gap between icon and text
                      Text(
                        _buttons[index],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
