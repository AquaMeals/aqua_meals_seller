import 'package:aqua_meals_seller/models/users.dart';
import 'package:aqua_meals_seller/screens/my_profile/build_custom_tile.dart';
import 'package:aqua_meals_seller/screens/my_profile/build_circular_profile_network_image.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
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
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
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
                    BuildCustomTile(
                      title: "User Account Settings",
                      subTitle: "${Users.getName}",
                      leadingIcon: Icons.lock,
                      trailingIcon: Icons.keyboard_arrow_right_rounded,
                      onTap: () {},
                    ),
                    SizedBox(height: getProportionateScreenHeight(2)),
                    BuildCustomTile(
                      title: "General Settings",
                      leadingIcon: Icons.settings,
                      trailingIcon: Icons.keyboard_arrow_right_rounded,
                      onTap: () {},
                    ),
                    SizedBox(height: getProportionateScreenHeight(2)),
                    BuildCustomTile(
                      title: "Change Password",
                      leadingIcon: Icons.lock,
                      trailingIcon: Icons.keyboard_arrow_right_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
              )
              // const ProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
