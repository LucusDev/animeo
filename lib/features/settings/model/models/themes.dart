import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData light = ThemeData.light().copyWith(
    splashColor: const Color.fromRGBO(48, 79, 254, 1),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      headline1: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 15,
        color: Colors.black54,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none, fillColor: Color.fromRGBO(231, 232, 235, 1)),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(244, 244, 255, 1),
      elevation: 0,
    ),
    errorColor: Colors.red.shade100,
    iconTheme: const IconThemeData(color: Color.fromRGBO(48, 79, 254, 1)),
    primaryColorLight: const Color.fromRGBO(235, 238, 255, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(247, 247, 255, 1),
    primaryColor: const Color.fromRGBO(48, 79, 254, 1),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color.fromRGBO(48, 79, 254, 1),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    splashColor: const Color.fromRGBO(48, 79, 254, 1),
    inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none, fillColor: Color.fromRGBO(20, 20, 20, 1)),
    errorColor: const Color.fromRGBO(37, 14, 19, 1),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Color.fromRGBO(37, 37, 37, 1),
        ),
        headline1: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 15,
          color: Colors.white60,
        ),
        headline6: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )),
    cardTheme: const CardTheme(
      color: Color.fromRGBO(37, 37, 37, 1),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: Color.fromRGBO(48, 79, 254, 1)),
    primaryColorLight: const Color.fromRGBO(17, 20, 37, 1),
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color.fromRGBO(48, 79, 254, 1),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color.fromRGBO(48, 79, 254, 1),
    ),
  );
}
