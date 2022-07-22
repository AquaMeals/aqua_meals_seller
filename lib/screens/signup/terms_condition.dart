import 'package:aqua_meals_seller/screens/check_login.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  static const String? routeName = "/TermsAndCondition";

  const TermsAndCondition({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const WaveLogoHeader(),
                  SizedBox(
                    height: SizeConfig.screenHeight -
                        getProportionateScreenHeight(175),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: [
                          const HeaderText(
                            firstText: "Terms & Condition",
                            lastText:
                                "You will receive intructions for reset your password.",
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: getProportionateScreenHeight(50),
                width: SizeConfig.screenWidth,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
