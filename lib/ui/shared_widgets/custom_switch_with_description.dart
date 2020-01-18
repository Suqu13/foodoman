import 'package:flutter/material.dart';

class CustomSwitchWitchDescription extends StatelessWidget {
  final bool value;
  final double fontSize;
  final Color fontColor;
  final String description;
  final Function(bool) handleOnChange;

  CustomSwitchWitchDescription(
      {@required this.value,
        this.fontSize,
        this.fontColor,
        this.description,
        this.handleOnChange});

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(description,
            style: TextStyle(fontSize: fontSize, color: fontColor)),
        Switch(value: value, onChanged: (value) => handleOnChange(value))
      ]);
}