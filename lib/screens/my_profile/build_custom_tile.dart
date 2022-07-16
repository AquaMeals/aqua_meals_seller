import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class BuildCustomTile extends StatelessWidget {
  final IconData? _leadingIcon, _trailingIcon;
  final String? _title, _subTitle;
  final void Function()? _onTap;

  const BuildCustomTile({
    Key? key,
    required IconData? leadingIcon,
    required IconData? trailingIcon,
    required String? title,
    String? subTitle = "",
    required void Function()? onTap,
  })  : _leadingIcon = leadingIcon,
        _trailingIcon = trailingIcon,
        _title = title,
        _subTitle = subTitle,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
        height: getProportionateScreenHeight(60),
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            Icon(
              _leadingIcon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: getProportionateScreenWidth(30)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Visibility(
                  visible: _subTitle!.isNotEmpty ? true : false,
                  child: Text(
                    _subTitle!,
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.5),
                      fontSize: getProportionateScreenWidth(13),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              _trailingIcon,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
