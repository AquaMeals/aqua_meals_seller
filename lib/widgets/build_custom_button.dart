import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class BuildCustomButton extends StatelessWidget {
  final Function()? _onTap;
  final String? _buttonText;
  const BuildCustomButton({Key? key, Function()? onTap, String? buttonText})
      : _onTap = onTap,
        _buttonText = buttonText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: _onTap,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        width: SizeConfig.screenWidth,
        height: getProportionateScreenHeight(44),
        // height: MediaQuery.of(context).size.height * 0.065,
        child: Center(
          child: Text(
            _buttonText!,
            textScaleFactor: 1.2,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
