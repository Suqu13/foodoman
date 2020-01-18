import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function onPressed;
  final String snackBarMessage;
  final String text;
  final IconData icon;

  CustomButton(
      {@required this.formKey,
        this.onPressed,
        this.snackBarMessage,
        this.text,
        this.icon});

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(20),
    width: double.infinity,
    child: RaisedButton(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      elevation: 10,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      onPressed: () {
        if (formKey.currentState.validate()) {
          onPressed();
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(snackBarMessage)));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text,
              style: TextStyle(fontSize: 20, color: Colors.grey[700])),
          Icon(icon, color: Colors.grey[700])
        ],
      ),
    ),
  );
}