import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aqua_meals_seller/screens/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String splashScreenRoute = "/splashScreenRoute";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
          splash: SizedBox(
            width: 350,
            // height: 1500,
            child: Image.asset(
              "assets/images/aqua_meals_logo.jpeg",
              fit: BoxFit.cover,
              // height: 800,
            ),
          ),
          curve: Curves.bounceIn,
          duration: 1500,
          animationDuration: const Duration(milliseconds: 1500),
          backgroundColor: Theme.of(context).canvasColor,
          centered: true,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: const Login()),
    );
  }
}
