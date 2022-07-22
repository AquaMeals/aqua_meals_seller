import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/crud/crud.dart';
import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/helper/preferences.dart';
import 'package:aqua_meals_seller/helper/wave_clipper.dart';
import 'package:aqua_meals_seller/screens/check_signup.dart';
import 'package:aqua_meals_seller/screens/home/build_curved_bottom_navigation_bar.dart';
import 'package:aqua_meals_seller/screens/login/forgot_password.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckLogin extends StatelessWidget {
  static const String? routeName = "/signin";
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const WaveLogoHeader(),
              SizedBox(
                // color: Colors.red,
                height:
                    SizeConfig.screenHeight - getProportionateScreenHeight(175),
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
                      const SigninForm(),
                      const Spacer(),
                      NoAccountStrip(
                        firstText: "Don't have an account? ",
                        lastText: "Sign up",
                        onTap: () {
                          navigatePushReplacement(
                              context: context, widget: const CheckSignup());
                        },
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
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
        height: getProportionateScreenHeight(140),
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

class SigninForm extends StatefulWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final TextEditingController? _emailController = TextEditingController();

  final TextEditingController? _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  void signInUser(BuildContext context) async {
    final FormState? _key = _formKey.currentState!;
    bool isValidated = FieldValidations.validationOnButton(formKey: _key);

    String _email = _emailController!.text;
    String _password = _passwordController!.text;

    if (isValidated == true) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        final UserCredential _user = await auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        String _userID = _user.user!.uid;

        CRUD().fetchUserCredentials(userID: _userID);
        await SharedPreferencesHelper().setAuthToken(_userID);
        navigatePushReplacement(
            context: context, widget: const BuildCurvedBottomNavigationBar());
        // Navigator.pushReplacementNamed(context,
        //     BuildCurvedBottomNavigationBar.buildCurvedBottomNavigationBarRoute);
      } catch (e) {
        showErrorMessage(
          context: context,
          e: e,
          title: "Unexpected Error Found",
          content: e.toString(),
        );
      }
    }
  }

  Future<dynamic> showErrorMessage(
      {BuildContext? context, Object? e, String? title, String? content}) {
    return showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(content!),
          actions: [
            TextButton(
              onPressed: () {
                _emailController!.clear();
                _passwordController!.clear();
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
                // Navigator.pushReplacementNamed(context, Login.loginPageRoute);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            hintText: "Enter your email",
            prefixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (value) {
              return FieldValidations.isEmail(value: value);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          PasswordTextFormField(
            hintText: "Enter your password",
            controller: _passwordController,
            validator: (value) {
              return FieldValidations.isPassword(value: value);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          ForgotPasswordLabel(
            onTap: () {
              navigatePush(
                  context: context,
                  widget: ResetPassword(
                    emailControllerText: _emailController!.text == ""
                        ? ""
                        : _emailController!.text,
                  ));
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          CustomButton(
            text: "Sign in",
            isDisable: false,
            onPressed: () {
              signInUser(context);
            },
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

class ForgotPasswordLabel extends StatelessWidget {
  final Function()? _onTap;
  const ForgotPasswordLabel({
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
            "Reset password?",
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

// class CustomButton extends StatelessWidget {
//   final String? _text;
//   final Function()? _onTap;
//   const CustomButton({
//     Key? key,
//     required Function()? onTap,
//     String? text,
//   })  : _text = text,
//         _onTap = onTap,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius:
//           BorderRadius.all(Radius.circular(getProportionateScreenWidth(20))),
//       onTap: _onTap,
//       child: Container(
//         width: SizeConfig.screenWidth,
//         height: getProportionateScreenHeight(50),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.5),
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.all(
//               Radius.circular(getProportionateScreenWidth(20))),
//         ),
//         child: Center(
//           child: Text(
//             _text!,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: getProportionateScreenWidth(17),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
