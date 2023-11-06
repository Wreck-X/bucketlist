import 'package:flutter/material.dart';

class ColorsClass {
  static const Color black = Color.fromARGB(255, 25, 25, 25);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color red = Color.fromARGB(223, 255, 0, 0);
  static const Color grey = Color.fromARGB(255, 95, 95, 95);
  static const Color violet = Color.fromARGB(255, 174, 79, 255);
  static const Color darkViolet = Color.fromARGB(255, 109, 49, 153);
  static const Color lightGrey = Color.fromARGB(255, 211, 211, 211);
  static const Color darkGrey = Color.fromARGB(255, 50, 50, 50);
  static const Color transparent = Color(0x44000000);
  static const Color lightblack = Color.fromARGB(255,30,30,30);
  static const Color purp = Color.fromARGB(255, 151, 31, 253);
}

class GlobalTheme {
  static const Color background = ColorsClass.black;
  static const Color backWidget = ColorsClass.darkGrey;
  static const Color accent = ColorsClass.violet;
  static const Color darkAccent = ColorsClass.darkViolet;
  static const Color foreground = ColorsClass.white;
}
