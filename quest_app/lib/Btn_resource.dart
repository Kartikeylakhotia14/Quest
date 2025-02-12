import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color btncolor;
  final Function onPressed;
  final btnText;

  RoundedButton(
      {@required this.btncolor, @required this.btnText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: btncolor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btnText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
