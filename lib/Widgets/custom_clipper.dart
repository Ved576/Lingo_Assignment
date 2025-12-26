import 'package:flutter/material.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double radius = 60;

    double startY = 80;

    final path = Path();

    path.moveTo(0, h);


    path.lineTo(0, startY);

    path.quadraticBezierTo(w * 0.25, 20, (w / 2) - radius, 20);

    path.arcToPoint(
      Offset((w / 2) + radius, 20),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    path.quadraticBezierTo(w * 0.75, 20, w, startY);

    path.lineTo(w, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}