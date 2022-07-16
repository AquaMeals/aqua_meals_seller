import 'package:aqua_meals_seller/models/users.dart';
import 'package:aqua_meals_seller/screens/my_profile/build_custom_tile.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
                onTap: () {},
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

class BuildCircularProfileNetworkImage extends StatelessWidget {
  final void Function()? _onTap;
  final File? _selectedImageFile;
  final String? _profileNetworkImageURL;
  const BuildCircularProfileNetworkImage({
    Key? key,
    void Function()? onTap,
    File? selectedImageFile,
    String? profileNetworkImageURL,
  })  : _onTap = onTap,
        _selectedImageFile = selectedImageFile,
        _profileNetworkImageURL = profileNetworkImageURL,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      borderRadius: BorderRadius.circular(100),
      child: (_profileNetworkImageURL != null)
          ? Container(
              width: getProportionateScreenWidth(130),
              height: getProportionateScreenWidth(130),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(getProportionateScreenWidth(100))),
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(100)),
                child: CachedNetworkImage(
                  imageUrl: _profileNetworkImageURL!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : Container(
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenHeight(100),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add_a_photo, color: Colors.white60),
            ),
    );
  }
}
