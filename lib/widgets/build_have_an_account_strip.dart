import 'package:flutter/material.dart';

class BuildHaveAnAccountStrip extends StatelessWidget {
  final String? _firstText;
  final String? _lastText;
  final void Function()? _onTap;
  const BuildHaveAnAccountStrip({
    Key? key,
    String? firstText,
    String? lastText,
    void Function()? onTap,
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
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        GestureDetector(
          onTap: _onTap,
          child: Text(
            _lastText!,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
