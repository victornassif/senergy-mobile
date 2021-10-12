import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xFF3C444C);
const secondColor = const Color(0xFFF7F8FC);
// const thirdColor = const Color(0xFF115173);
// const borderColor = const Color(0xFFD8ECF6);
// const accentColor = const Color(0xFF87FFF1);

ThemeData theme() {
  return ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      canvasColor: secondColor,
      // secondaryHeaderColor: thirdColor,
      // accentColor: accentColor,
      // cardColor: borderColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
