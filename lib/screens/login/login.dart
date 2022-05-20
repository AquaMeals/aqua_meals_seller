import 'package:aqua_meals_seller/screens/home/build_curved_bottom_navigation_bar.dart';
import 'package:aqua_meals_seller/screens/home/home.dart';
import 'package:aqua_meals_seller/screens/signup/signup.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/validations.dart';
import 'package:aqua_meals_seller/widgets/build_custom_button.dart';
import 'package:aqua_meals_seller/widgets/build_custom_text_field.dart';
import 'package:aqua_meals_seller/widgets/build_have_an_account_strip.dart';
import 'package:aqua_meals_seller/widgets/login_signup_heading.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String loginPageRoute = "/login";
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
          height: SizeConfig.screenHeight,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              const LoginSignupHeading(
                  firstText: "Welcome ", secondText: "Back"),
              SizedBox(height: getProportionateScreenHeight(5)),
              Container(
                width: SizeConfig.screenWidth,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please sign in to continue",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
              const Spacer(),
              const LoginForm(),
              const Spacer(),
              BuildHaveAnAccountStrip(
                firstText: "Don't have an account? ",
                lastText: "Sign up",
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, Signup.signupPageRoute);
                },
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuildCustomTextUnderlinedField(
            hintText: "Enter your email",
            prefixIcon: Icons.email,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              return FieldValidations.isEmail(value: value);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          BuildCustomPasswordUnderlinedField(
            hintText: "Enter your password",
            prefixIcon: Icons.lock,
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              return FieldValidations.isPassword(value: value);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          SizedBox(
            width: SizeConfig.screenWidth,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot Password",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          BuildCustomButton(
            buttonText: "Signin",
            onTap: () {
              bool _validation = FieldValidations.validationOnButton(
                  formKey: _formKey.currentState);
              if (_validation == true) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const BuildCurvedBottomNavigationBar())));
              }
            },
          ),
        ],
      ),
    );
  }
}
