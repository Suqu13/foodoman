import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  CustomImage({@required this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Center(
              child: FadeInImage.memoryNetwork(
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: image),
            ),
          ),
        ],
      );
}
