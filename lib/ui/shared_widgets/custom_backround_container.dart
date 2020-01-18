import 'package:flutter/material.dart';

class CustomBackgroundContainer extends StatelessWidget {
  final Widget child;

  CustomBackgroundContainer({@required this.child});

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.7, 0.9, 1.0],
        colors: [
          Colors.grey[100],
          Colors.indigo[400],
          Colors.indigo[600],
        ],
      )),
      child: child);
}
