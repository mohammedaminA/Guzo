import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  CustomTextWidget(
      {@required this.textInputType,
      @required this.hintText,
      @required this.icon,
      @required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: textInputType,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.lightBlueAccent,
        prefixIcon: Icon(
          icon,
        ),
      ),
    );
  }
}
