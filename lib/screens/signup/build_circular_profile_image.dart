import 'dart:io';

import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class BuildCircularProfileImage extends StatelessWidget {
  final void Function()? _onTap;
  final File? _selectedImageFile;
  const BuildCircularProfileImage({
    Key? key,
    @required void Function()? onTap,
    @required File? selectedImageFile,
  })  : _onTap = onTap,
        _selectedImageFile = selectedImageFile,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      borderRadius: BorderRadius.circular(100),
      child: (_selectedImageFile != null)
          ? Container(
              width: getProportionateScreenWidth(100),
              height: getProportionateScreenHeight(100),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  _selectedImageFile!,
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
