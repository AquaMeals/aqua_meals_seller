import 'dart:io';
import 'package:aqua_meals_seller/models/users.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/validations.dart';
import 'package:aqua_meals_seller/widgets/build_circular_profile_image.dart';
import 'package:aqua_meals_seller/widgets/build_custom_button.dart';
import 'package:aqua_meals_seller/widgets/build_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String? _imagePath;
  File? _selectedImageFile;

  final TextEditingController? _nameController = TextEditingController();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final TextEditingController? _confirmPasswordController =
      TextEditingController();
  final TextEditingController? _phoneNumberController = TextEditingController();
  final TextEditingController? _cnicController = TextEditingController();

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImageFile = File(_image!.path);
      _imagePath = _image.path;
    });
  }

  @override
  void initState() {
    _nameController!.text = Users.getName!;
    _emailController!.text = Users.getEmail!;
    _passwordController!.text = Users.getPassword!;
    _confirmPasswordController!.text = Users.getPassword!;
    _phoneNumberController!.text = Users.getPhoneNumber!;
    _cnicController!.text = Users.getCnic!;
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            BuildCustomTextUnderlinedField(
              controller: _nameController,
              hintText: "Your full name",
              prefixIcon: Icons.person,
              textInputType: TextInputType.name,
              validator: (value) {
                return FieldValidations.isName(value: value);
              },
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            BuildCustomTextUnderlinedField(
              controller: _emailController,
              hintText: "Your email",
              prefixIcon: Icons.email,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                return FieldValidations.isEmail(value: value);
              },
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            BuildCustomPasswordUnderlinedField(
              controller: _passwordController,
              hintText: "your password",
              prefixIcon: Icons.lock,
              validator: (value) {
                return FieldValidations.isPassword(value: value);
              },
              textInputType: TextInputType.text,
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            BuildCustomPasswordUnderlinedField(
              controller: _confirmPasswordController,
              hintText: "Confirm your password",
              prefixIcon: Icons.lock,
              validator: (value) {
                return FieldValidations.isPassword(value: value);
              },
              textInputType: TextInputType.text,
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            BuildCustomTextUnderlinedField(
              controller: _phoneNumberController,
              hintText: "Your phone number",
              prefixIcon: Icons.phone,
              textInputType: TextInputType.phone,
              validator: (value) {
                return FieldValidations.isPhoneNumber(value: value);
              },
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            BuildCustomTextUnderlinedField(
              controller: _cnicController,
              hintText: "Your CNIC number",
              prefixIcon: Icons.credit_card,
              textInputType: TextInputType.number,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            BuildCustomButton(
              buttonText: "Save",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
