import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double size;
  final Color color;
  final Color splashColor;
  final EdgeInsets padding;
  final IconData iconData;
  final Function onPressed;

  CustomIconButton(
      {@required this.size,
        this.color,
        this.splashColor,
        this.padding,
        this.iconData,
        this.onPressed});

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      customBorder: CircleBorder(),
      onTap: () => this.onPressed(),
      splashColor: splashColor,
      child: Padding(
        padding: padding,
        child: Icon(
          iconData,
          size: size,
          color: color,
        ),
      ),
    ),
  );
}
