import 'dart:io';

import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuildCircularProfileNetworkImage extends StatefulWidget {
  final String? _profileNetworkImageURL;
  const BuildCircularProfileNetworkImage({
    Key? key,
    void Function()? onTap,
    File? selectedImageFile,
    String? profileNetworkImageURL,
  })  : _profileNetworkImageURL = profileNetworkImageURL,
        super(key: key);

  @override
  State<BuildCircularProfileNetworkImage> createState() =>
      _BuildCircularProfileNetworkImageState();
}

class _BuildCircularProfileNetworkImageState
    extends State<BuildCircularProfileNetworkImage> {
  String? _imagePath;
  File? _selectedImageFile;

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImageFile = File(_image!.path);
      _imagePath = _image.path;
    });
    print("Image Path: $_imagePath");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (_selectedImageFile != null)
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
                  child: Image.file(
                    _selectedImageFile!,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : (widget._profileNetworkImageURL!.isNotEmpty)
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
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(100)),
                      child: CachedNetworkImage(
                        imageUrl: widget._profileNetworkImageURL!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    width: getProportionateScreenWidth(130),
                    height: getProportionateScreenWidth(130),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(getProportionateScreenWidth(100))),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                  ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: pickImage,
            child: Container(
              width: getProportionateScreenWidth(50),
              height: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(getProportionateScreenWidth(100))),
                border: Border.all(color: Colors.white),
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
