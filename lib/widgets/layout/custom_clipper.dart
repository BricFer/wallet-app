import 'package:flutter/material.dart';

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
