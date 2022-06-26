import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class BuildSmallButton extends StatelessWidget {
  final void Function()? _onPressed;
  final Widget? _child;
  final Color? _backgroundcolor;
  const BuildSmallButton({
    Key? key,
    void Function()? onPressed,
    Widget? child,
    Color? backgroundcolor,
  })  : _onPressed = onPressed,
        _child = child,
        _backgroundcolor = backgroundcolor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: _child,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(60),
            vertical: getProportionateScreenHeight(15))),
        backgroundColor: MaterialStateProperty.all(_backgroundcolor),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    );
  }
}
