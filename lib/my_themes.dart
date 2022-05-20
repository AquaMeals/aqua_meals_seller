import 'package:aqua_meals_seller/constraints.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: colorCustom,
      primaryColor: kPrimaryColor,
      primaryColorLight: lightgreyColor,
      inputDecorationTheme:
          const InputDecorationTheme(prefixIconColor: kPrimaryColor),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    );
  }
}
