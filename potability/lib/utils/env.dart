import 'package:flutter/material.dart';

class MyConstants {
  // Screen width
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Screen height
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Primary color
  static Color primaryColor = Color.fromARGB(255, 110, 65, 50);

  // Secondary color (teal)
  static Color secondaryColor = Color.fromARGB(255, 186, 146, 43);
  // Background color
  static Color backgroundColor = const Color.fromARGB(255, 254, 254, 254);
  static Color navColor = Color.fromARGB(255, 42, 35, 35);
  // text color
  static Color textColor = Colors.white70;
  static Color titleColor = Colors.cyanAccent;
  static Color titleColor2 = Colors.white;
}