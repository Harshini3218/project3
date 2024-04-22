import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/logo1.svg', // Replace 'assets/logo.png' with your logo asset path
              width: 167.19,
              height: 50,
            ),
          ),
          
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            // Handle profile button tap
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
