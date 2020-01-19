import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final void Function(T) onChanged;
  final String labelText;
  final T value;
  final List<DropdownMenuItem<T>> items;

  CustomDropdownButton(
      {@required this.onChanged, this.labelText, this.value, this.items, key}) : super(key: key);

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
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    value: value,
                    onChanged: (value) => onChanged(value),
                    items: items,
                    decoration: InputDecoration(
                      labelText: labelText,
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
