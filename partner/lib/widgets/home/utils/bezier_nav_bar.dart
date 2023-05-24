import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);
  // const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //screen index (defaults to home screen)
  int index = 0;

  void switchToScreen(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (ClipPath(
      clipper: NavBarClipPath(),
      child: Container(
        color: Colors.red,
        child: Center(child: Text('clip path')),
        height: 200,
      ),
    ));
  }
}

class NavBarClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // double w = size.width;
    // double h = size.height;
    // double dip_w = w / 5;
    // double dip_f = h / 3;
    //
    // final path = Path();
    //
    // path.lineTo(0, h);
    // path.lineTo(w, h);
    // path.lineTo(w, 0);
    // path.lineTo(dip_w * 3, 0);
    // path.quadraticBezierTo(w/2, h * 0.8, dip_w * 2, 0);
    // // path.lineTo(dip_w * 2, 0);
    // path.close();
    //
    // return path;
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(0 * _xScaling,8 * _yScaling);
    path.cubicTo(0 * _xScaling,3.58172 * _yScaling,3.58172 * _xScaling,0 * _yScaling,8 * _xScaling,0 * _yScaling,);
    path.cubicTo(8 * _xScaling,0 * _yScaling,93.75 * _xScaling,0 * _yScaling,93.75 * _xScaling,0 * _yScaling,);
    path.cubicTo(93.75 * _xScaling,0 * _yScaling,132 * _xScaling,0 * _yScaling,132 * _xScaling,0 * _yScaling,);
    path.cubicTo(140.837 * _xScaling,0 * _yScaling,148.02 * _xScaling,7.33379 * _yScaling,151.067 * _xScaling,15.6284 * _yScaling,);
    path.cubicTo(155.189 * _xScaling,26.8491 * _yScaling,164.851 * _xScaling,40 * _yScaling,187.5 * _xScaling,40 * _yScaling,);
    path.cubicTo(210.734 * _xScaling,40 * _yScaling,220.639 * _xScaling,26.8355 * _yScaling,224.862 * _xScaling,15.611 * _yScaling,);
    path.cubicTo(227.973 * _xScaling,7.34034 * _yScaling,235.163 * _xScaling,0 * _yScaling,244 * _xScaling,0 * _yScaling,);
    path.cubicTo(244 * _xScaling,0 * _yScaling,279 * _xScaling,0 * _yScaling,279 * _xScaling,0 * _yScaling,);
    path.cubicTo(279 * _xScaling,0 * _yScaling,367 * _xScaling,0 * _yScaling,367 * _xScaling,0 * _yScaling,);
    path.cubicTo(371.418 * _xScaling,0 * _yScaling,375 * _xScaling,3.58172 * _yScaling,375 * _xScaling,8 * _yScaling,);
    path.cubicTo(375 * _xScaling,8 * _yScaling,375 * _xScaling,83 * _yScaling,375 * _xScaling,83 * _yScaling,);
    path.cubicTo(375 * _xScaling,83 * _yScaling,0 * _xScaling,83 * _yScaling,0 * _xScaling,83 * _yScaling,);
    path.cubicTo(0 * _xScaling,83 * _yScaling,0 * _xScaling,8 * _yScaling,0 * _xScaling,8 * _yScaling,);
    path.cubicTo(0 * _xScaling,8 * _yScaling,0 * _xScaling,8 * _yScaling,0 * _xScaling,8 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
