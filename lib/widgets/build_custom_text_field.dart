import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class BuildCustomTextBorderedField extends StatelessWidget {
  final String? _hintText;
  final IconData? _prefixIcon;
  final String? Function(String?)? _validator;
  final TextInputType? _textInputType;
  const BuildCustomTextBorderedField({
    Key? key,
    @required String? hintText,
    @required IconData? prefixIcon,
    @required String? Function(String?)? validator,
    @required TextInputType? textInputType,
  })  : _hintText = hintText,
        _prefixIcon = prefixIcon,
        _validator = validator,
        _textInputType = textInputType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(13)),
        hintText: _hintText,
        prefixIcon: Icon(_prefixIcon),
        enabledBorder: buildCustomOutlineInputBorder(context),
        focusedBorder: buildCustomOutlineInputBorder(context),
        disabledBorder: buildCustomOutlineInputBorder(context),
        border: buildCustomOutlineInputBorder(context),
        errorBorder: buildCustomOutlineInputBorder(context),
        focusedErrorBorder: buildCustomOutlineInputBorder(context),
      ),
      keyboardType: _textInputType,
      autovalidateMode: AutovalidateMode.always,
      validator: _validator,
    );
  }
}

class BuildCustomPasswordBorderedField extends StatefulWidget {
  final String? _hintText;
  final IconData? _prefixIcon;

  final String? Function(String?)? _validator;
  final TextInputType? _textInputType;
  const BuildCustomPasswordBorderedField({
    Key? key,
    @required String? hintText,
    @required IconData? prefixIcon,
    @required String? Function(String?)? validator,
    @required TextInputType? textInputType,
  })  : _hintText = hintText,
        _prefixIcon = prefixIcon,
        _validator = validator,
        _textInputType = textInputType,
        super(key: key);

  @override
  State<BuildCustomPasswordBorderedField> createState() =>
      _BuildCustomPasswordBorderedFieldState();
}

class _BuildCustomPasswordBorderedFieldState
    extends State<BuildCustomPasswordBorderedField> {
  bool _isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(13)),
        hintText: widget._hintText,
        prefixIcon: Icon(widget._prefixIcon),
        suffixIcon: GestureDetector(
          onTap: isPasswordVisible,
          child: _isObsecureText
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.black54,
                )
              : Icon(
                  Icons.visibility,
                  color: Theme.of(context).primaryColor,
                ),
        ),
        enabledBorder: buildCustomOutlineInputBorder(context),
        focusedBorder: buildCustomOutlineInputBorder(context),
        disabledBorder: buildCustomOutlineInputBorder(context),
        border: buildCustomOutlineInputBorder(context),
        errorBorder: buildCustomOutlineInputBorder(context),
        focusedErrorBorder: buildCustomOutlineInputBorder(context),
      ),
      keyboardType: widget._textInputType,
      obscureText: _isObsecureText,
      autovalidateMode: AutovalidateMode.always,
      validator: widget._validator,
    );
  }

  void isPasswordVisible() {
    setState(() {
      _isObsecureText = !_isObsecureText;
    });
  }
}

class BuildCustomTextUnderlinedField extends StatelessWidget {
  final String? _hintText;
  final IconData? _prefixIcon;
  final String? Function(String?)? _validator;
  final TextInputType? _textInputType;
  final TextEditingController? _controller;
  const BuildCustomTextUnderlinedField(
      {Key? key,
      @required String? hintText,
      @required IconData? prefixIcon,
      @required String? Function(String?)? validator,
      @required TextInputType? textInputType,
      @required TextEditingController? controller})
      : _hintText = hintText,
        _prefixIcon = prefixIcon,
        _validator = validator,
        _textInputType = textInputType,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(13)),
        hintText: _hintText,
        prefixIcon: Icon(_prefixIcon),
        enabledBorder: buildCustomUnderlinedInputBorder(context),
        focusedBorder: buildCustomUnderlinedInputBorder(context),
        disabledBorder: buildCustomUnderlinedInputBorder(context),
        border: buildCustomUnderlinedInputBorder(context),
        errorBorder: buildCustomUnderlinedInputBorder(context),
        focusedErrorBorder: buildCustomUnderlinedInputBorder(context),
      ),
      controller: _controller,
      keyboardType: _textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: _validator,
    );
  }
}

class BuildCustomPasswordUnderlinedField extends StatefulWidget {
  final String? _hintText;
  final IconData? _prefixIcon;
  final TextEditingController? _controller;
  final String? Function(String?)? _validator;
  final TextInputType? _textInputType;
  const BuildCustomPasswordUnderlinedField({
    Key? key,
    @required String? hintText,
    @required IconData? prefixIcon,
    @required String? Function(String?)? validator,
    @required TextInputType? textInputType,
    @required TextEditingController? controller,
  })  : _hintText = hintText,
        _prefixIcon = prefixIcon,
        _validator = validator,
        _controller = controller,
        _textInputType = textInputType,
        super(key: key);

  @override
  State<BuildCustomPasswordUnderlinedField> createState() =>
      _BuildCustomPasswordUnderlinedFieldState();
}

class _BuildCustomPasswordUnderlinedFieldState
    extends State<BuildCustomPasswordUnderlinedField> {
  bool _isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(13)),
        hintText: widget._hintText,
        prefixIcon: Icon(widget._prefixIcon),
        suffixIcon: GestureDetector(
          onTap: isPasswordVisible,
          child: _isObsecureText
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.black54,
                )
              : Icon(
                  Icons.visibility,
                  color: Theme.of(context).primaryColor,
                ),
        ),
        enabledBorder: buildCustomUnderlinedInputBorder(context),
        focusedBorder: buildCustomUnderlinedInputBorder(context),
        disabledBorder: buildCustomUnderlinedInputBorder(context),
        border: buildCustomUnderlinedInputBorder(context),
        errorBorder: buildCustomUnderlinedInputBorder(context),
        focusedErrorBorder: buildCustomUnderlinedInputBorder(context),
      ),
      controller: widget._controller,
      keyboardType: widget._textInputType,
      obscureText: _isObsecureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget._validator,
    );
  }

  void isPasswordVisible() {
    setState(() {
      _isObsecureText = !_isObsecureText;
    });
  }
}
