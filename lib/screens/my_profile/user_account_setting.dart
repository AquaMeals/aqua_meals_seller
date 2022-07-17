import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class UserAccountSettings extends StatelessWidget {
  static const String userAccountSettingsPageRoute = "/userAccountSettings";
  const UserAccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      bottom: false,
      top: true,
      child: Scaffold(),
    );
  }
}
