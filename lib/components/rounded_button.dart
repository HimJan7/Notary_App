import 'package:flutter/material.dart';

class roundButton extends StatelessWidget {
  final String name;
  final VoidCallback onPress;
  final Color buttonColor;
  const roundButton(
      {required this.name, required this.onPress, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.06,
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
