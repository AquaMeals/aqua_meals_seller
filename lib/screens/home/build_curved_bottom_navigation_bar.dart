import 'package:aqua_meals_seller/screens/home/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BuildCurvedBottomNavigationBar extends StatefulWidget {
  static const String buildCurvedBottomNavigationBarRoute =
      "/buildCurvedBottomNavigationBar";
  const BuildCurvedBottomNavigationBar({Key? key}) : super(key: key);
  @override
  _BuildCurvedBottomNavigationBarState createState() =>
      _BuildCurvedBottomNavigationBarState();
}

class _BuildCurvedBottomNavigationBarState
    extends State<BuildCurvedBottomNavigationBar> {
  int _page = 0;

  final _screens = [
    const Home(),
    const Home(),
    const Home(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    const _items2 = <Widget>[
      Icon(Icons.card_travel, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.perm_identity, size: 30),
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        drawer: Drawer(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        appBar: AppBar(
          centerTitle: true,
        ),
        body: _screens[_page],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 1,
            height: 50.0,
            items: _items2,
            color: Theme.of(context).primaryColor,
            buttonBackgroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
