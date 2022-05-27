import 'package:flutter/material.dart';

class ProfileCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, 4*size.height/5);

    Offset curvePoint2 = Offset(size.width/2, size.height);
    Offset endPoint = Offset(size.width, 4*size.height/5 );


    path.quadraticBezierTo(
      curvePoint2.dx,
      curvePoint2.dy,
      endPoint.dx,
      endPoint.dy,);
    path.lineTo(size.width, 0);
    path.close();



    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper)=> true;

}