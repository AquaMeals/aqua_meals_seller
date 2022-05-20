import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class LoginSignupHeading extends StatelessWidget {
  final String? _firstText;
  final String? _secondText;

  const LoginSignupHeading({
    Key? key,
    String? firstText,
    String? secondText,
  })  : _firstText = firstText,
        _secondText = secondText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getProportionateScreenHeight(50),
      width: SizeConfig.screenWidth,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            _firstText!,
            textScaleFactor: 2.1,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _secondText!,
            textScaleFactor: 2.1,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
