import 'package:aqua_meals_seller/crud/crud.dart';
import 'package:aqua_meals_seller/helper/preferences.dart';
import 'package:aqua_meals_seller/screens/home/build_curved_bottom_navigation_bar.dart';
import 'package:aqua_meals_seller/screens/login/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String splashRoute = "/splashRoute";
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _nextScreenNavigator();
    super.initState();
  }

  _nextScreenNavigator() async {
    await Future.delayed(const Duration(milliseconds: 1500), () async {
      final String? token = await SharedPreferencesHelper().getAuthToken();
      if (token != null && token.isNotEmpty) {
        CRUD().fetchUserCredentials(userID: token);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    const BuildCurvedBottomNavigationBar())));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => const Login())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/images/aqua_meals_logo.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
