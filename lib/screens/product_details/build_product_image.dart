import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:flutter/material.dart';

class BuildProductImage extends StatelessWidget {
  final String? _productImageUrl;
  final String? _productID;
  const BuildProductImage({
    Key? key,
    String? productImageUrl,
    String? productID,
  })  : _productImageUrl = productImageUrl,
        _productID = productID,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _productID!,
      child: SizedBox(
        height: getProportionateScreenHeight(400),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(getProportionateScreenWidth(50)),
            bottomRight: Radius.circular(getProportionateScreenWidth(50)),
          ),
          child: Image.network(
            _productImageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
