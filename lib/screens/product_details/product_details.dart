import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/models/products.dart';
import 'package:aqua_meals_seller/widgets/build_price_lebel_with_unit.dart';
import 'package:aqua_meals_seller/screens/product_details/build_product_image.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/build_custom_small_button.dart';
import 'package:aqua_meals_seller/widgets/build_star_rating.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Products _productData;
  const ProductDetails({Key? key, productData})
      : _productData = productData,
        super(key: key);

  final double? _ratingValue = 3.5;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBody: true,
        bottomSheet: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.only(
            bottom: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20),
            left: getProportionateScreenWidth(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuildSmallButton(
                child: const Icon(Icons.delete),
                backgroundcolor: Colors.red.withOpacity(0.7),
                onPressed: () {},
              ),
              BuildSmallButton(
                child: const Icon(Icons.edit),
                backgroundcolor: Colors.green.withOpacity(0.7),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: Colors.pink,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getProportionateScreenWidth(50)),
                    topRight: Radius.circular(getProportionateScreenWidth(50)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(420),
                    right: getProportionateScreenHeight(20),
                    left: getProportionateScreenHeight(20),
                    bottom: getProportionateScreenHeight(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            _productData.productName!.capitalize(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: getProportionateScreenWidth(20),
                            ),
                          ),
                          BuildPriceLebelWithUnit(
                            regularPrice: _productData.regularPrice,
                            discountedPrice: _productData.discountedPrice,
                            unit: _productData.unit,
                            smallTextFontSize: getProportionateScreenWidth(12),
                            largeTextFontSize: getProportionateScreenWidth(20),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildStarRating(
                            ratingValue: _ratingValue,
                          ),
                          Text(
                            _productData.currentProductStatusValue == "0"
                                ? "Out of Stock"
                                : "In Stock",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: getProportionateScreenWidth(15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category: ${_productData.category!.capitalize()}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(14),
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color!,
                            ),
                          ),
                          Text(
                            "Uploaded On: ${_productData.userCreatedDate!}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(14),
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color!,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Text(
                        _productData.productDescription!.capitalize(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(14),
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BuildProductImage(
                productID: _productData.productID,
                productImageUrl: _productData.productImageUrl,
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
