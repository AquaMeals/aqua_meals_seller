import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/helper/wave_clipper.dart';
import 'package:aqua_meals_seller/screens/check_login.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class CheckSignup extends StatelessWidget {
  const CheckSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2189eb),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const WaveLogoHeader(),
              SizedBox(
                height: getProportionateScreenHeight(586),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10)),
                  child: Column(
                    children: [
                      const HeaderText(
                        firstText: "Sign up",
                        lastText: "Please sign up to register",
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      const SignuppForm(),
                      const Spacer(),
                      // SizedBox(height: getProportionateScreenHeight(20)),
                      NoAccountStrip(
                        firstText: "Already have an account? ",
                        lastText: "Sign in",
                        onTap: () {
                          navigatePushReplacement(
                              context: context, widget: const CheckLogin());
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(5)),
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

class WaveLogoHeader extends StatelessWidget {
  const WaveLogoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperBottom(),
      child: Container(
        height: getProportionateScreenHeight(185),
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Image.asset(
          lightThemeLogo!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SignuppForm extends StatelessWidget {
  const SignuppForm({
    Key? key,
  }) : super(key: key);

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
          SizedBox(height: getProportionateScreenHeight(20)),
          CustomButton(
            text: "Sign up",
            onTap: () {},
          ),
        ],
      ),
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
