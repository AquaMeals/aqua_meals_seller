import 'package:aqua_meals_seller/constraints.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class StatusDropdownButtonField extends StatefulWidget {
  final Function(String?)? _onChanged;
  final String? _currentValue;
  const StatusDropdownButtonField(
      {Key? key, Function(String?)? onChanged, String? currentValue})
      : _onChanged = onChanged,
        _currentValue = currentValue,
        super(key: key);

  @override
  State<StatusDropdownButtonField> createState() =>
      _StatusDropdownButtonFieldState();
}

class _StatusDropdownButtonFieldState extends State<StatusDropdownButtonField> {
  final items = ['Active', 'In-Active'];

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      child: Text(item),
      value: item,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        enabledBorder: coloredOutlineInputBorder(context),
        border: coloredOutlineInputBorder(context),
        focusedBorder: coloredOutlineInputBorder(context),
        errorBorder: coloredErrorOutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13),
            horizontal: getProportionateScreenHeight(13)),
        filled: true,
        fillColor: Theme.of(context).primaryColor.withOpacity(0.25),
      ),
      isEmpty: widget._currentValue == '',
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem(
              child: Text(
                "Active",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              value: "1",
            ),
            DropdownMenuItem(
              child: Text(
                "In-Active",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              value: "0",
            ),
          ],

          // items: items.map(buildMenuItem).toList(),
          hint: Text(
            "Select your product status",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          iconEnabledColor: Theme.of(context).primaryColor,
          value: widget._currentValue,
          isDense: true,
          isExpanded: true,
          onChanged: widget._onChanged,
        ),
      ),
    );
  }
}
