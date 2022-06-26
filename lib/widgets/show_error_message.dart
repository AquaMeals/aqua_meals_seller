import 'package:flutter/material.dart';

class ShowErrorMessage extends StatelessWidget {
  final void Function()? _onTap;
  final String? _title;
  final String? _content;
  final String? _buttonText;

  const ShowErrorMessage({
    Key? key,
    Function()? onTap,
    String? title,
    String? content,
    String? buttonText,
  })  : _onTap = onTap,
        _title = title,
        _content = content,
        _buttonText = buttonText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title!),
      content: Text(_content!),
      actions: [
        TextButton(
          onPressed: _onTap,
          child: Text(_buttonText!),
        ),
      ],
    );
  }
}
