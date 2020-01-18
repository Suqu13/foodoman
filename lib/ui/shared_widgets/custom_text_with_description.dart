import 'package:flutter/material.dart';

class CustomTextWithDescription extends StatelessWidget {
  final String description;
  final String content;

  CustomTextWithDescription({@required this.description, this.content});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
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
            Text(content,
                style: TextStyle(fontSize: 15, color: Colors.grey[700]))
          ],
        ),
      ),
    ),
  );
}