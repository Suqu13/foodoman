import 'package:flutter/material.dart';

class CustomAnimatedTextWithDescription extends StatelessWidget {
  final String description;
  final String content;
  final Duration duration;
  final Curve curve;
  final TickerProvider vsync;

  CustomAnimatedTextWithDescription(
      {@required this.description,
        this.content,
        this.duration,
        this.curve,
        this.vsync});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: 80),
    child: Card(
      elevation: 10,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(description,
                style: TextStyle(fontSize: 10, color: Colors.grey[700])),
            AnimatedSize(
                duration: duration,
                vsync: vsync,
                curve: curve,
                child: Text(content,
                    style:
                    TextStyle(fontSize: 15, color: Colors.grey[700])))
          ],
        ),
      ),
    ),
  );
}