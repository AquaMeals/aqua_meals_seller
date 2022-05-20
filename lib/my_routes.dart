import 'package:aqua_meals_seller/screens/home/build_curved_bottom_navigation_bar.dart';
import 'package:aqua_meals_seller/screens/home/home.dart';
import 'package:aqua_meals_seller/screens/login/login.dart';
import 'package:aqua_meals_seller/screens/signup/signup.dart';

var myRoutes = {
  Login.loginPageRoute: (context) => const Login(),
  Signup.signupPageRoute: (context) => const Signup(),
  Home.homePageRoute: (context) => const BuildCurvedBottomNavigationBar(),
  BuildCurvedBottomNavigationBar.buildCurvedBottomNavigationBarRoute:
      (context) => const BuildCurvedBottomNavigationBar(),
};
