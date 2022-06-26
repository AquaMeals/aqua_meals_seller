import 'package:aqua_meals_seller/crud/crud.dart';
import 'package:aqua_meals_seller/models/bottom_navigation_key.dart';
import 'package:aqua_meals_seller/models/users.dart';
import 'package:aqua_meals_seller/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(Users.getProfileImageURL!)),
              margin: EdgeInsets.zero,
              accountName: Text(Users.getName!),
              accountEmail: Text(Users.getEmail!),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home_outlined),
            onTap: () {
              BottomNavigationBarKey.getBottomNavigationBarKey()
                  .currentState!
                  .setPage(2);
            },
          ),
          ListTile(
            title: const Text("My Profile"),
            leading: const Icon(Icons.person_outline),
            onTap: () {
              BottomNavigationBarKey.getBottomNavigationBarKey()
                  .currentState!
                  .setPage(4);
            },
          ),
          ListTile(
            title: const Text("My Products"),
            leading: const Icon(MdiIcons.cubeOutline),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const MyProducts()));

              BottomNavigationBarKey.getBottomNavigationBarKey()
                  .currentState!
                  .setPage(0);
            },
          ),
          ListTile(
            title: const Text("My Orders"),
            leading: const Icon(MdiIcons.clipboardTextOutline),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => const MyOrders())));

              BottomNavigationBarKey.getBottomNavigationBarKey()
                  .currentState!
                  .setPage(1);
            },
          ),
          ListTile(
            title: const Text("My Balance"),
            leading: const Icon(MdiIcons.cash),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text("Support"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("About Us"),
            leading: const Icon(Icons.info_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Signout"),
            leading: const Icon(Icons.logout),
            onTap: () {
              CRUD().signout();
              Users.setAllFieldsNull();
              Navigator.pushReplacementNamed(context, Login.loginPageRoute);
            },
          ),
        ],
      ),
    );
  }
}
