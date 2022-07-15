import 'package:aqua_meals_seller/constraints.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: whiteColor,
      primarySwatch: colorCustom,
      primaryColor: klightPrimaryColor,
      cardColor: klightCardColor,
      primaryColorLight: klightgreyColor,
      textTheme: const TextTheme(bodyText1: TextStyle(color: klightTextColor)),
      canvasColor: Colors.white,
      listTileTheme:
          const ListTileThemeData(textColor: whiteColor, iconColor: whiteColor),
      dividerColor: whiteColor,
      inputDecorationTheme:
          const InputDecorationTheme(prefixIconColor: klightPrimaryColor),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    );
  }
}
