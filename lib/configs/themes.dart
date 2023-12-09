import 'package:flutter/material.dart';

import 'x_configs.dart';

class MyThemes {
  static final lightMode = ThemeData(
      primarySwatch: kBlue,
      primaryColor: kBlue,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1)));

  static final darkMode = ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Color(0xFFf07167),
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1)));
}
