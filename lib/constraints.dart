import 'package:flutter/material.dart';

const Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
const MaterialColor colorCustom = MaterialColor(0xFF0977de, color);
const Color? kPrimaryColor = Color(0xFF2189eb);
const Color? lightgreyColor = Colors.black54;
const Color? whiteColor = Color(0xFFffffff);

const EdgeInsetsGeometry? textFieldContentPadding =
    EdgeInsets.symmetric(vertical: 13);

OutlineInputBorder coloredErrorOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Colors.red),
  );
}

OutlineInputBorder coloredOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Theme.of(context).primaryColor),
  );
}

OutlineInputBorder buildCustomOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Theme.of(context).primaryColor),
  );
}

UnderlineInputBorder buildCustomUnderlinedInputBorder(BuildContext context) {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: Theme.of(context).primaryColor),
  );
}
