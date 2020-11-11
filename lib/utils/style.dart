import 'dart:ui';

import 'package:correct/utils/hex_color.dart';
import 'package:flutter/material.dart';

class Style {
  static const double smallPadding = 8;
  static const double mediumPadding = 12;
  static const double bigPadding = 16;
  static const double hugePadding = 20;
  static const double tinyPadding = 4;
  static const double tinyElevation = 2;
  static const double bigElevation = 8;
  static const double mediumRadius = 2;
  static const double expandedAppBarHeight = 200;
  static Color darkSurfaceColor = HexColor("#121212");
  static Color surface = Colors.white;
  static Color secondarySurface = Color(0xffF0F0F0);
  static Color darkBackgroundColor = darkSurfaceColor;
  static Color primaryColor = Color(0xff8687B4);
  static Color onPrimary = Colors.white;
  static Color onError = Colors.white;
  static Color primaryVariant = Color(0xFF068b8d);
  static Color secondaryColor = Color(0xff0056be);
  static Color onSecondary = Colors.white;
  static Color errorColor = HexColor("df4e4e");
  static Color successColor = Colors.green;
  static TextStyle title = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: "Secca",
      textBaseline: TextBaseline.alphabetic);
  static TextStyle subtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: "Lato",
  );
  static TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: "Lato",
  );
  static TextStyle overline = TextStyle(
    color: Colors.black38,
    fontSize: 10,
    letterSpacing: 1.5,
    fontFamily: "Lato",
  );
  static TextStyle body = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static Color getDarkSurfaceColor(double height) {
    return Color.alphaBlend(
        Colors.white.withOpacity(height / 100.0), darkSurfaceColor);
  }

  static ThemeData getThemeData() {
    return ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: body.copyWith(color: Colors.black54),
        filled: true,
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        border: OutlineInputBorder(),
      ),
      primaryColor: primaryColor,
      cardColor: surface,
      scaffoldBackgroundColor: surface,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(mediumRadius),
        ),
        elevation: 4,
        color: surface,
        margin: EdgeInsets.all(0),
      ),
      dividerTheme: DividerThemeData(thickness: 1),
      buttonTheme: ButtonThemeData(
        minWidth: 200,
        height: 40,
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        secondaryVariant: secondaryColor,
        primaryVariant: primaryVariant,
        onSurface: Colors.black,
      ),
    );
  }
}
