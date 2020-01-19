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
        stops: [0.1, 0.2, 0.6],
        colors: [
          Colors.indigo[600],
          Colors.indigo[400],

          Colors.grey[100],
        ],
      )),
      child: child);
}
