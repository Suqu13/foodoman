import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFiled extends StatelessWidget {
  final String labelText;
  final bool numbersOnly;
  final TextEditingController controller;

  CustomTextFiled(
      {@required this.labelText, this.numbersOnly = false, this.controller});

  isNumeric(String value) => double.tryParse(value) != null;

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
            children: <Widget>[
              TextFormField(
                  minLines: 1,
                  maxLines: null,
                  inputFormatters: numbersOnly
                      ? [WhitelistingTextInputFormatter.digitsOnly]
                      : null,
                  keyboardType: numbersOnly ? TextInputType.number : null,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Pole nie może pozostać puste';
                    } else if (numbersOnly && !isNumeric(value)) {
                      return 'Proszę wprowadzić wartości liczbowe';
                    }
                    return null;
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: labelText,
                    border: InputBorder.none,
                  )),
            ],
          )),
    ),
  );
}