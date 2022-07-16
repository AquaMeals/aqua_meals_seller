import 'dart:io';
import 'package:aqua_meals_seller/helper/bottom_navigation_key.dart';
import 'package:aqua_meals_seller/models/users.dart';
import 'package:aqua_meals_seller/widgets/build_category_dropdown.dart';
import 'package:aqua_meals_seller/widgets/show_error_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/screens/add_Products/add_product_image.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/validations.dart';
import 'package:aqua_meals_seller/widgets/build_custom_button.dart';
import 'package:aqua_meals_seller/widgets/status_dropdown_button_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  String? _currentProductStatusValue;
  String? _imagePath;
  File? _selectedImageFile;
  String? selectedCategory;
  String? selectedUnit;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController? _productNameController = TextEditingController();
  final TextEditingController? _regularPriceController =
      TextEditingController();
  final TextEditingController? _discountedPriceController =
      TextEditingController();
  final TextEditingController? _productDescriptionController =
      TextEditingController();

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImageFile = File(_image!.path);
      _imagePath = _image.path;
    });
  }

  void addProduct(BuildContext context) async {
    if (Users.getStatus != 0) {
      final FormState? _key = _formKey.currentState!;
      bool isValidated = FieldValidations.validationOnButton(formKey: _key);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      String? _userCreatedDate = getCurrentDate();
      String _productName = _productNameController!.text;
      String _regularPrice = _regularPriceController!.text;
      String _discountedPrice = _discountedPriceController!.text;
      String _productDescription = _productDescriptionController!.text;

      File _profileImageFile = File(_imagePath!);

      String _imageBaseName = basename(_profileImageFile.path);

      if (isValidated == true &&
          _profileImageFile.path != "" &&
          _currentProductStatusValue != null &&
          selectedUnit!.isNotEmpty == true &&
          selectedCategory!.isNotEmpty == true) {
        try {
          firebase_storage.Reference ref =
              firebase_storage.FirebaseStorage.instance.ref().child(
                  "images/Sellers/${Users.getUserId}/productImages/$_imageBaseName");

          await ref.putFile(_profileImageFile);
          String _getProductImageUrl = await ref.getDownloadURL();

          FirebaseFirestore _db = FirebaseFirestore.instance;
          await _db
              .collection("products")
              .doc(Users.getUserId)
              .collection("myProducts")
              .add({
            "userID": Users.getUserId,
            "name": _productName,
            "regularPrice": _regularPrice,
            "discountedPrice": _discountedPrice,
            "description": _productDescription,
            "imageURL": _getProductImageUrl,
            "status": _currentProductStatusValue,
            "category": selectedCategory,
            "unit": selectedUnit,
            "createdDate": _userCreatedDate,
          });

          BottomNavigationBarKey.getBottomNavigationBarKey()
              .currentState!
              .setPage(2);
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) {
              return ShowErrorMessage(
                title: "Unexpected Error Found",
                content: e.toString(),
                buttonText: "OK",
                onTap: () {
                  BottomNavigationBarKey.getBottomNavigationBarKey()
                      .currentState!
                      .setPage(3);
                },
              );
            },
          );
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return ShowErrorMessage(
            title: "Unapproved Seller",
            content:
                "Sorry! you are unable to upload your products, the account will be approved within 48 hours. Thank You.",
            buttonText: "OK",
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              BottomNavigationBarKey.getBottomNavigationBarKey()
                  .currentState!
                  .setPage(3);
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AddProductImage(
            onTap: pickImage,
            selectedImageFile: _selectedImageFile,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            controller: _productNameController,
            keyboardType: TextInputType.name,
            cursorColor: Theme.of(context).primaryColor,
            validator: (value) {
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(13),
                  horizontal: getProportionateScreenHeight(13)),
              hintText: "Product name",
              hintStyle: TextStyle(color: Theme.of(context).primaryColor),
              filled: true,
              fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
              enabledBorder: coloredOutlineInputBorder(context),
              border: coloredOutlineInputBorder(context),
              focusedBorder: coloredOutlineInputBorder(context),
              errorBorder: coloredErrorOutlineInputBorder(),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * 0.42,
                child: TextFormField(
                  controller: _regularPriceController,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).primaryColor,
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Regular price",
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(13),
                        horizontal: getProportionateScreenHeight(13)),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
                    enabledBorder: coloredOutlineInputBorder(context),
                    border: coloredOutlineInputBorder(context),
                    focusedBorder: coloredOutlineInputBorder(context),
                    errorBorder: coloredErrorOutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.42,
                child: TextFormField(
                  controller: _discountedPriceController,
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).primaryColor,
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Discounted price",
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(13),
                        horizontal: getProportionateScreenHeight(13)),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
                    enabledBorder: coloredOutlineInputBorder(context),
                    border: coloredOutlineInputBorder(context),
                    focusedBorder: coloredOutlineInputBorder(context),
                    errorBorder: coloredErrorOutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: BuildCategoryDropdown(
                  collectionName: "category",
                  onchanged: (newSelectedCategory) {
                    setState(() {
                      selectedCategory = newSelectedCategory;
                    });
                  },
                  value: selectedCategory,
                ),
              ),
              SizedBox(
                width: 150,
                child: BuildCategoryDropdown(
                  collectionName: "units",
                  onchanged: (newSelectedUnit) {
                    setState(() {
                      selectedUnit = newSelectedUnit;
                    });
                  },
                  value: selectedUnit,
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            controller: _productDescriptionController,
            keyboardType: TextInputType.name,
            cursorColor: Theme.of(context).primaryColor,
            validator: (value) {
              return null;
            },
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Product description",
              hintStyle: TextStyle(color: Theme.of(context).primaryColor),
              filled: true,
              fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
              enabledBorder: coloredOutlineInputBorder(context),
              border: coloredOutlineInputBorder(context),
              focusedBorder: coloredOutlineInputBorder(context),
              errorBorder: coloredErrorOutlineInputBorder(),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          StatusDropdownButtonField(
            currentValue: _currentProductStatusValue,
            onChanged: (selectedProductStatusValue) {
              setState(() {
                _currentProductStatusValue = selectedProductStatusValue;
              });
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          BuildCustomButton(
            buttonText: "Add Product",
            onTap: () {
              addProduct(context);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    );
  }
}
