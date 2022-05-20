import 'package:aqua_meals_seller/my_routes.dart';
import 'package:aqua_meals_seller/my_themes.dart';
import 'package:aqua_meals_seller/screens/home/build_curved_bottom_navigation_bar.dart';
import 'package:aqua_meals_seller/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //check for error
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Auqa Meals Seller',
            theme: MyThemes.lightTheme(),
            initialRoute: BuildCurvedBottomNavigationBar
                .buildCurvedBottomNavigationBarRoute,
            routes: myRoutes,
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const CircularProgressIndicator();
      },
    );
  }
}
