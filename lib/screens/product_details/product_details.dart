import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/models/products.dart';
import 'package:aqua_meals_seller/screens/product_details/build_price_lebel_with_unit.dart';
import 'package:aqua_meals_seller/screens/product_details/build_product_image.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/build_custom_small_button.dart';
import 'package:aqua_meals_seller/widgets/build_star_rating.dart';
import 'package:flutter/material.dart';

// class ProductDetails extends StatelessWidget {
//   final Products _productData;
//   const ProductDetails({Key? key, productData})
//       : _productData = productData,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SafeArea(
//       top: true,
//       bottom: false,
//       child: Scaffold(
//         extendBody: true,
//         // drawer: const MyDrawer(),
//         appBar: AppBar(
//           title: const Text("Product Details"),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.delete),
//             ),
//             IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
//             child: Column(
//               children: [
//                 Hero(
//                   tag: _productData.productID.toString(),
//                   child:
//                       BuildProductImage(imageUrl: _productData.productImageUrl),
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(20)),
//                 BuildCustomDetailsStrip(
//                   label: "Product Name",
//                   labelDetails: _productData.productName,
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(20)),
//                 BuildCustomDetailsStrip(
//                   label: "Product Price",
//                   labelDetails: "Rs ${_productData.regularPrice}/-",
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(20)),
//                 BuildCustomDetailsStrip(
//                   label: "Discounted Price",
//                   labelDetails: "Rs ${_productData.discountedPrice}/-",
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(20)),
//                 BuildCustomDetailsStrip(
//                   label: "Product Status",
//                   labelDetails: (_productData.currentProductStatusValue) == "0"
//                       ? "In-Active"
//                       : "Active",
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(20)),
//                 BuildCustomDetailsStrip(
//                   label: "Product Description",
//                   labelDetails: _productData.productDescription,
//                 ),
//                 SizedBox(height: getProportionateScreenHeight(20)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     BuildSmallButton(
//                       child: const Icon(Icons.delete),
//                       backgroundcolor: Colors.red.withOpacity(0.7),
//                       onPressed: () {},
//                     ),
//                     BuildSmallButton(
//                       child: const Icon(Icons.edit),
//                       backgroundcolor: Colors.green.withOpacity(0.7),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BuildCustomDetailsStrip extends StatelessWidget {
//   final String? _label;
//   final String? _labelDetails;
//   const BuildCustomDetailsStrip({
//     Key? key,
//     String? label,
//     String? labelDetails,
//   })  : _label = label,
//         _labelDetails = labelDetails,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: SizeConfig.screenWidth * 0.31,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             textDirection: TextDirection.ltr,
//             children: [
//               Text(
//                 _label!,
//                 style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: SizeConfig.screenWidth * 0.6,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             textDirection: TextDirection.ltr,
//             children: [
//               Text(
//                 _labelDetails!,
//                 style: const TextStyle(
//                   color: Colors.red,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

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
        extendBody: true,
        // appBar: AppBar(
        //   title: const Text("Product Details"),
        //   centerTitle: true,
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.delete),
        //     ),
        //     IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        //   ],
        // ),
        bottomSheet: Padding(
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
                      // SizedBox(height: getProportionateScreenHeight(10)),
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
