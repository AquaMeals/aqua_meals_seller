import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/helper/wave_clipper.dart';
import 'package:aqua_meals_seller/screens/check_signup.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

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
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      const HeaderText(
                        firstText: "Welcome back!",
                        lastText: "Please sign in to continue",
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      const LoginnForm(),
                      const Spacer(),
                      NoAccountStrip(
                        firstText: "Don't have an account? ",
                        lastText: "Sign up",
                        onTap: () {
                          navigatePushReplacement(
                              context: context, widget: const CheckSignup());
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

class HeaderText extends StatelessWidget {
  final String? _firstText;
  final String? _lastText;
  const HeaderText({
    Key? key,
    String? firstText,
    String? lastText,
  })  : _firstText = firstText,
        _lastText = lastText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _firstText!,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: getProportionateScreenWidth(30),
            ),
          ),
          Text(
            _lastText!,
            style: TextStyle(
              color: Colors.white.withOpacity(0.3),
              fontSize: getProportionateScreenWidth(15),
            ),
          ),
        ],
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

class LoginnForm extends StatelessWidget {
  const LoginnForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            hintText: "Enter your email",
            prefixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          PasswordTextFormField(
            hintText: "Enter your password",
            controller: TextEditingController(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          ForgotPassword(onTap: () {}),
          SizedBox(height: getProportionateScreenHeight(20)),
          CustomButton(
            text: "Sign in",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? _controller;
  final IconData? _prefixIcon;
  final String? _hintText;
  final TextInputType? _textInputType;
  final String? Function(String?)? _validator;
  const CustomTextFormField({
    Key? key,
    TextEditingController? controller,
    IconData? prefixIcon,
    String? hintText,
    TextInputType? textInputType,
    String? Function(String?)? validator,
  })  : _controller = controller,
        _prefixIcon = prefixIcon,
        _hintText = hintText,
        _textInputType = textInputType,
        _validator = validator,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: _validator,
      keyboardType: _textInputType,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: _hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(_prefixIcon, color: Colors.white),
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        enabledBorder: customOutlinedInputBorder(context),
        focusedBorder: customOutlinedInputBorder(context),
        border: customOutlinedInputBorder(context),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
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

class CustomButton extends StatelessWidget {
  final String? _text;
  final Function()? _onTap;
  const CustomButton({
    Key? key,
    required Function()? onTap,
    String? text,
  })  : _text = text,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
        width: SizeConfig.screenWidth,
        height: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(
              Radius.circular(getProportionateScreenWidth(20))),
        ),
        child: Center(
          child: Text(
            _text!,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(17),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  final String? _hintText;
  final TextEditingController? _controller;
  final String? Function(String?)? _validator;
  const PasswordTextFormField({
    Key? key,
    required String? hintText,
    required TextEditingController? controller,
    String? Function(String?)? validator,
  })  : _hintText = hintText,
        _controller = controller,
        _validator = validator,
        super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obsecure = true;

  isPasswordVisibile() {
    setState(() {
      _obsecure = !_obsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      obscureText: _obsecure,
      validator: widget._validator,
      keyboardType: TextInputType.text,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget._hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
        suffixIcon: GestureDetector(
          onTap: isPasswordVisibile,
          child: Icon(_obsecure ? Icons.visibility_off : Icons.visibility,
              color: Colors.white),
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        enabledBorder: customOutlinedInputBorder(context),
        focusedBorder: customOutlinedInputBorder(context),
        border: customOutlinedInputBorder(context),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
      ),
    );
  }
}

OutlineInputBorder customOutlinedInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(getProportionateScreenWidth(20))),
    borderSide: const BorderSide(
      color: Colors.white,
    ),
  );
}
