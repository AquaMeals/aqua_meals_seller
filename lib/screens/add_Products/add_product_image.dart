import 'dart:io';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class AddProductImage extends StatelessWidget {
  final void Function()? _onTap;
  final File? _selectedImageFile;
  const AddProductImage({
    Key? key,
    void Function()? onTap,
    File? selectedImageFile,
  })  : _onTap = onTap,
        _selectedImageFile = selectedImageFile,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: (_selectedImageFile != null)
          ? Container(
              height: getProportionateScreenHeight(180),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.25),
                  borderRadius: BorderRadius.all(
                      Radius.circular(getProportionateScreenHeight(30)))),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(getProportionateScreenHeight(30))),
                child: Image.file(
                  _selectedImageFile!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : Container(
              height: getProportionateScreenHeight(180),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.25),
                  borderRadius: BorderRadius.all(
                      Radius.circular(getProportionateScreenHeight(30)))),
              child: Icon(
                Icons.add_a_photo,
                color: Theme.of(context).primaryColor,
              ),
            ),
    );
  }
}
