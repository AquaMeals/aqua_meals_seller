import 'package:aqua_meals_seller/screens/home/build_curved_bottom_navigation_bar.dart';
import 'package:aqua_meals_seller/screens/home/home.dart';
import 'package:aqua_meals_seller/screens/login/login.dart';
import 'package:aqua_meals_seller/screens/my_orders/order_tabbar.dart';
import 'package:aqua_meals_seller/screens/my_orders/pending_orders.dart';
import 'package:aqua_meals_seller/screens/signup/signup.dart';
import 'package:aqua_meals_seller/screens/splash_screen/splash.dart';
import 'package:aqua_meals_seller/screens/splash_screen/splash_screen.dart';

var myRoutes = {
  Splash.splashRoute: (context) => const Splash(),
  SplashScreen.splashScreenRoute: (context) => const SplashScreen(),
  Login.loginPageRoute: (context) => const Login(),
  Signup.signupPageRoute: (context) => const Signup(),
  Home.homePageRoute: (context) => const BuildCurvedBottomNavigationBar(),
  BuildCurvedBottomNavigationBar.buildCurvedBottomNavigationBarRoute:
      (context) => const BuildCurvedBottomNavigationBar(),
  PendingOrders.pendingOrdersRoute: (context) => const PendingOrders(),
  Orders.ordersRoute: (context) => const Orders(),
};
