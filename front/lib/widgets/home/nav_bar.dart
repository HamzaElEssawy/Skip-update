import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    const items = <Widget>[
      Icon(Icons.home, size: 30, color: Colors.white),
      Icon(Icons.data_exploration, size: 30, color: Colors.white),
      // Icon(Icons.qr_code_2, size: 30, color: Colors.teal,),
      Icon(Icons.qr_code_2, size: 30, ),
      // Icon(Icons.qr_code_2, size: 30, color: ColorConstant.darkBlueBackground),
      Icon(Icons.notifications, size: 30, color: Colors.white),
      Icon(Icons.person, size: 30, color: Colors.white),
    ];
    return CurvedNavigationBar(items: items,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: Colors.transparent,
        // color: Colors.tealAccent.withOpacity(0.9)
        color: Colors.teal,
        );
  }
}
