import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xFF3C444C);
const secondColor = const Color(0xFFF7F8FC);

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFF0E7AC7),
    100: const Color(0xFF0E7AC7),
    200: const Color(0xFF0E7AC7),
    300: const Color(0xFF0E7AC7),
    400: const Color(0xFF0E7AC7),
    500: const Color(0xFF0E7AC7),
    600: const Color(0xFF0E7AC7),
    700: const Color(0xFF0E7AC7),
    800: const Color(0xFF0E7AC7),
    900: const Color(0xFF0E7AC7),
  },
);

// const thirdColor = const Color(0xFF115173);
// const borderColor = const Color(0xFFD8ECF6);
// const accentColor = const Color(0xFF87FFF1);

ThemeData theme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    primarySwatch: kPrimaryColor,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      )
    ),
    accentColor: Color(0xffFFDB00),
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
