import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: whiteColor,
      backgroundColor: whiteColor,
      primarySwatch: colorCustom,
      primaryColor: klightPrimaryColor,
      cardColor: klightCardColor,
      primaryColorLight: klightgreyColor,
      buttonTheme: const ButtonThemeData(buttonColor: klightPrimaryColor),
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: lightTextTheme(),
      canvasColor: Colors.white,
      expansionTileTheme: ExpansionTileThemeData(
        collapsedIconColor: klightPrimaryColor,
        collapsedBackgroundColor: klightCardColor,
        backgroundColor: klightCardColor,
      ),
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

TextTheme lightTextTheme() {
  return const TextTheme(
    bodyText1: TextStyle(
      color: klightTextColor,
      fontSize: 15,
    ),
  );
}
