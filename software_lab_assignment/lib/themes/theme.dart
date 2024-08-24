import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: Colors.orange,
  hintColor: Colors.green,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black54),
    labelLarge: TextStyle(fontSize: 18, color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
