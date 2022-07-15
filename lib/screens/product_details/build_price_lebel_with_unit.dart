import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class BuildPriceLebelWithUnit extends StatelessWidget {
  final String? _regularPrice;
  final String? _discountedPrice;
  final String? _unit;
  const BuildPriceLebelWithUnit({
    Key? key,
    String? regularPrice,
    String? discountedPrice,
    String? unit,
  })  : _regularPrice = regularPrice,
        _discountedPrice = discountedPrice,
        _unit = unit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _discountedPrice!.isNotEmpty
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _regularPrice!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.5),
                  fontSize: getProportionateScreenWidth(12),
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "${_discountedPrice!} Rs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                  TextSpan(
                    text: " / ${_unit!}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                ]),
              ),
            ],
          )
        : RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "${_regularPrice!} Rs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
              TextSpan(
                text: " / ${_unit!}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText1!.color!,
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
            ]),
          );
  }
}
