import 'dart:io';
import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/screens/login/login.dart';
import 'package:aqua_meals_seller/screens/signup/build_circular_profile_image.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/validations.dart';
import 'package:aqua_meals_seller/widgets/build_custom_button.dart';
import 'package:aqua_meals_seller/widgets/build_custom_text_field.dart';
import 'package:aqua_meals_seller/widgets/build_have_an_account_strip.dart';
import 'package:aqua_meals_seller/widgets/login_signup_heading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Signup extends StatelessWidget {
  static const String signupPageRoute = "/signup";
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight, //isko baad main dekhna hai * 0.95
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                // SizedBox(height: getProportionateScreenHeight(30)),
                const LoginSignupHeading(
                  firstText: "Create ",
                  secondText: "Account",
                ),
                // const Spacer(),
                SizedBox(height: getProportionateScreenHeight(20)),
                const SignupForm(),
                const Spacer(),
                BuildHaveAnAccountStrip(
                  firstText: "Already have a accound? ",
                  lastText: "Sign in",
                  onTap: () {
                    Navigator.pushNamed(context, Login.loginPageRoute);
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String? _imagePath;
  File? _selectedImageFile;
  bool _isCheckedTermsAndCondition = false;
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

  void createUser(BuildContext context) async {
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
    String _name = _nameController!.text;
    String _email = _emailController!.text;
    String _password = _passwordController!.text;
    String _confirmPassword = _confirmPasswordController!.text;
    String _phoneNumber = _phoneNumberController!.text;
    String _cnic = _cnicController!.text;

    File _profileImageFile = File(_imagePath!);

    String _imageBaseName = basename(_profileImageFile.path);
    if (isValidated == true &&
        _profileImageFile.path != "" &&
        _isCheckedTermsAndCondition == true) {
      if (_password == _confirmPassword) {
        try {
          FirebaseAuth auth = FirebaseAuth.instance;

          final UserCredential _user =
              await auth.createUserWithEmailAndPassword(
                  email: _email, password: _confirmPassword);

          String _userID = _user.user!.uid;

          firebase_storage.Reference ref =
              firebase_storage.FirebaseStorage.instance.ref().child(
                  "images/Sellers/$_userID/userProfileImage/$_imageBaseName");

          await ref.putFile(_profileImageFile);
          String _getUserProfileImageUrl = await ref.getDownloadURL();

          FirebaseFirestore _db = FirebaseFirestore.instance;
          await _db
              .collection("users")
              .doc("WvamEGwHsbNkF3KImk2V")
              .collection("sellers")
              .doc(_userID)
              .set({
            "userID": _userID,
            "name": _name,
            "email": _email,
            "password": _confirmPassword,
            "phoneNumber": _phoneNumber,
            "cnic": _cnic,
            "profileImage": _getUserProfileImageUrl,
            "createdDate": _userCreatedDate,
            "status": 0,
          });

          Navigator.pushReplacementNamed(context, Login.loginPageRoute);
        } catch (e) {}
      }
    }
  }

  void isCheckedTermsAndCondition() {
    setState(() {
      _isCheckedTermsAndCondition = !_isCheckedTermsAndCondition;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuildCircularProfileImage(
            onTap: pickImage,
            selectedImageFile: _selectedImageFile,
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          BuildCustomTextUnderlinedField(
            controller: _nameController,
            hintText: "Your full name",
            prefixIcon: Icons.person,
            textInputType: TextInputType.name,
            validator: (value) {
              return FieldValidations.isName(value: value);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          BuildCustomTextUnderlinedField(
            controller: _emailController,
            hintText: "Your email",
            prefixIcon: Icons.email,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              return FieldValidations.isEmail(value: value);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          BuildCustomPasswordUnderlinedField(
            controller: _passwordController,
            hintText: "your password",
            prefixIcon: Icons.lock,
            validator: (value) {
              return FieldValidations.isPassword(value: value);
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          BuildCustomPasswordUnderlinedField(
            controller: _confirmPasswordController,
            hintText: "Confirm your password",
            prefixIcon: Icons.lock,
            validator: (value) {
              return FieldValidations.isPassword(value: value);
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          BuildCustomTextUnderlinedField(
            controller: _phoneNumberController,
            hintText: "Your phone number",
            prefixIcon: Icons.phone,
            textInputType: TextInputType.phone,
            validator: (value) {
              return FieldValidations.isPhoneNumber(value: value);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          BuildCustomTextUnderlinedField(
            controller: _cnicController,
            hintText: "Your CNIC number",
            prefixIcon: Icons.credit_card,
            textInputType: TextInputType.number,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          Row(
            children: [
              Checkbox(
                value: _isCheckedTermsAndCondition,
                onChanged: (value) {
                  isCheckedTermsAndCondition();
                },
                checkColor: Theme.of(context).primaryColor,
                activeColor: Colors.transparent,
                focusColor: Colors.purple,
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.5,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "I've read and understood Aqua Meals",
                    softWrap: true,
                    style: TextStyle(color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          BuildCustomButton(
            buttonText: "Signup",
            onTap: () {
              createUser(context);
            },
          ),
        ],
      ),
    );
  }
}
