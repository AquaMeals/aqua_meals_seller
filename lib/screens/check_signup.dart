import 'dart:io';

import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/screens/check_login.dart';
import 'package:aqua_meals_seller/screens/login/forgot_password.dart';
import 'package:aqua_meals_seller/screens/signup/terms_condition.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class CheckSignup extends StatelessWidget {
  static const String? routeName = "/signup";
  const CheckSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const WaveLogoHeader(),
                  Container(
                    // color: Colors.red,
                    height: SizeConfig.screenHeight -
                        getProportionateScreenHeight(175),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeaderText(
                            firstText: "Sign up",
                            lastText: "Please sign up to register",
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          const SignuppForm(),
                          const Spacer(),
                          NoAccountStrip(
                            firstText: "Already have an account? ",
                            lastText: "Sign in",
                            onTap: () {
                              navigatePushReplacement(
                                  context: context, widget: const CheckLogin());
                            },
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                // color: Colors.amber.withOpacity(0.3),
                height: getProportionateScreenHeight(220),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircularProfile(
                            onTap: () {},
                            selectedImageFile: File(""),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularProfile extends StatelessWidget {
  final void Function()? _onTap;
  final File? _selectedImageFile;
  const CircularProfile({
    Key? key,
    required void Function()? onTap,
    required File? selectedImageFile,
  })  : _onTap = onTap,
        _selectedImageFile = selectedImageFile,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      borderRadius: BorderRadius.circular(100),
      child: (_selectedImageFile == null)
          ? Container(
              width: getProportionateScreenWidth(80),
              height: getProportionateScreenHeight(80),
              decoration: const BoxDecoration(
                color: Colors.white,
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
                color: Colors.white.withOpacity(0.3),
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add_a_photo, color: Colors.white),
            ),
    );
  }
}

class SignuppForm extends StatefulWidget {
  const SignuppForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignuppForm> createState() => _SignuppFormState();
}

class _SignuppFormState extends State<SignuppForm> {
  bool _isCheckedTermsAndCondition = false;

  void isCheckedTermsAndCondition() {
    setState(() {
      _isCheckedTermsAndCondition = !_isCheckedTermsAndCondition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            hintText: "Enter your name",
            prefixIcon: Icons.person_outline,
            textInputType: TextInputType.name,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          CustomTextFormField(
            hintText: "Enter your email",
            prefixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          PasswordTextFormField(
            hintText: "Enter your password",
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          PasswordTextFormField(
            hintText: "Confirm your password",
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          CustomTextFormField(
            hintText: "Enter your number",
            prefixIcon: Icons.phone_outlined,
            textInputType: TextInputType.number,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          CustomTextFormField(
            hintText: "Enter your CNIC number",
            prefixIcon: Icons.credit_card_outlined,
            textInputType: TextInputType.number,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(4)),
          TermsConditionCheckBox(
            isCheckedTermsAndCondition: _isCheckedTermsAndCondition,
            onChange: (value) {
              isCheckedTermsAndCondition();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          CustomButton(
            text: "Sign up",
            isDisable: false,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TermsConditionCheckBox extends StatelessWidget {
  final bool? _isCheckedTermsAndCondition;
  final void Function(bool?)? _onChange;
  const TermsConditionCheckBox({
    Key? key,
    required bool? isCheckedTermsAndCondition,
    required void Function(bool?)? onChange,
  })  : _isCheckedTermsAndCondition = isCheckedTermsAndCondition,
        _onChange = onChange,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isCheckedTermsAndCondition,
          onChanged: _onChange,
          checkColor: Theme.of(context).primaryColor,
          activeColor: Colors.white,
          focusColor: Colors.white,
          side: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "I've read and understood Aqua Meals",
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(15),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => TermsAndCondition())));
              },
              child: Text(
                "Terms & Conditions",
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class NoAccountStrip extends StatelessWidget {
  final String? _firstText;
  final String? _lastText;
  final Function()? _onTap;
  const NoAccountStrip({
    Key? key,
    required String? firstText,
    required String? lastText,
    required Function()? onTap,
  })  : _firstText = firstText,
        _lastText = lastText,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _firstText!,
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenWidth(15),
          ),
        ),
        GestureDetector(
          onTap: _onTap,
          child: Text(
            _lastText!,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(15),
            ),
          ),
        ),
      ],
    );
  }
}

class ForgotPassword extends StatelessWidget {
  final Function()? _onTap;
  const ForgotPassword({
    Key? key,
    required Function()? onTap,
  })  : _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: _onTap,
          child: Text(
            "forgot password?",
            style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(15),
            ),
          ),
        ),
      ],
    );
  }
}
