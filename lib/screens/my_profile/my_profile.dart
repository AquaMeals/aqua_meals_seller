import 'package:aqua_meals_seller/models/users.dart';
import 'package:aqua_meals_seller/screens/my_profile/build_custom_tile.dart';
import 'package:aqua_meals_seller/screens/my_profile/build_circular_profile_network_image.dart';
import 'package:aqua_meals_seller/screens/my_profile/profile_form.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  static const String myProfilePageRoute = "/myProfile";
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      bottom: false,
      top: true,
      child: Scaffold(
        extendBody: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text("My Profile"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(0)),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                BuildCircularProfileNetworkImage(
                  profileNetworkImageURL: Users.getProfileImageURL,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Container(
                  child: Column(
                    children: [
                      BuildCustomExpensionListTile(
                        title: "User Account Settings",
                        leadingIcon: Icons.person,
                        children: [
                          Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Column(
                              children: [
                                const ProfileForm(),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(2)),
                      BuildCustomExpensionListTile(
                        title: "General Settings",
                        leadingIcon: Icons.settings,
                        children: [
                          Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Column(
                              children: [
                                SwitchListTile(
                                  title: Text(
                                    "Theme",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildCustomExpensionListTile extends StatelessWidget {
  final String? _title;
  final IconData? _leadingIcon;
  final List<Widget> _children;
  const BuildCustomExpensionListTile({
    Key? key,
    required String? title,
    required IconData? leadingIcon,
    required List<Widget> children,
  })  : _title = title,
        _leadingIcon = leadingIcon,
        _children = children,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        _title!,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: Icon(
        _leadingIcon,
        color: Theme.of(context).primaryColor,
      ),
      children: _children,
      expandedAlignment: Alignment.topCenter,
    );
  }
}
