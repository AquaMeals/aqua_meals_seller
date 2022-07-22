import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/screens/check_login.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/validations.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  static const String? routeName = "/ForgotPassword";
  final String? _emailControllerText;

  const ResetPassword({
    Key? key,
    String? emailControllerText,
  })  : _emailControllerText = emailControllerText,
        super(key: key);

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
                  SizedBox(
                    height: SizeConfig.screenHeight -
                        getProportionateScreenHeight(175),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: [
                          const HeaderText(
                            firstText: "Reset Password",
                            lastText:
                                "You will receive intructions for reset your password.",
                          ),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          ResetPasswordForm(
                              emailControllerText: _emailControllerText),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: getProportionateScreenHeight(50),
                width: SizeConfig.screenWidth,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  final String? _emailControllerText;
  const ResetPasswordForm({
    Key? key,
    String? emailControllerText,
  })  : _emailControllerText = emailControllerText,
        super(key: key);

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController? _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isClicked = false;

  @override
  void initState() {
    _emailController!.text = widget._emailControllerText!;
    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    super.dispose();
  }

  resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    setState(() {
      _isClicked = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
          SizedBox(height: getProportionateScreenHeight(20)),
          CustomButton(
            text: "Reset Email",
            isDisable: _isClicked,
            onPressed: _isClicked
                ? () {}
                : () async {
                    await resetPassword();
                    print(_emailController!.text);
                  },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Visibility(
            visible: _isClicked,
            child: Column(
              children: [
                const Text(
                  "Instructions to reset your password have been sent successfully.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Container(
                  width: getProportionateScreenWidth(150),
                  child: CustomButton(
                      text: "go to sign in",
                      onPressed: () {
                        navigatePushReplacement(
                            context: context, widget: const CheckLogin());
                      }),
                ),
              ],
            ),
            // child: NoAccountStrip(
            //   firstText:
            //       'Instructions to reset your password have been sent successfully. ',
            //   lastText: "Sign up",
            //   onTap: () {
            //     navigatePushReplacement(
            //         context: context, widget: const CheckLogin());
            //   },
            // ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String? _text;
  final void Function()? _onPressed;
  final bool _isDisable;
  const CustomButton({
    Key? key,
    required String? text,
    required void Function()? onPressed,
    bool isDisable = false,
  })  : _text = text,
        _onPressed = onPressed,
        _isDisable = isDisable,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(50),
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            _isDisable
                ? Colors.white.withOpacity(0.3)
                : Colors.white.withOpacity(0.5),
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(20))),
              side: BorderSide(
                  color: _isDisable
                      ? Colors.white.withOpacity(0.3)
                      : Colors.white))),
        ),
        child: Text(
          _text!,
          style: TextStyle(
            color: _isDisable ? Colors.white.withOpacity(0.3) : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(17),
          ),
        ),
      ),
    );
  }
}
