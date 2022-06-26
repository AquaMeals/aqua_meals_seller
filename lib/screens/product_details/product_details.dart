import 'package:aqua_meals_seller/models/products.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/build_custom_small_button.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Products _productData;
  const ProductDetails({Key? key, productData})
      : _productData = productData,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String? imageUrl =
        "https://images.pexels.com/photos/302743/pexels-photo-302743.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        // drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text("Product Details"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: Column(
              children: [
                BuildProductImage(imageUrl: _productData.productImageUrl),
                SizedBox(height: getProportionateScreenHeight(20)),
                BuildCustomDetailsStrip(
                  label: "Product Name",
                  labelDetails: _productData.productName,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                BuildCustomDetailsStrip(
                  label: "Product Price",
                  labelDetails: "Rs ${_productData.regularPrice}/-",
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                BuildCustomDetailsStrip(
                  label: "Discounted Price",
                  labelDetails: "Rs ${_productData.discountedPrice}/-",
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                BuildCustomDetailsStrip(
                  label: "Product Status",
                  labelDetails: (_productData.currentProductStatusValue) == "0"
                      ? "In-Active"
                      : "Active",
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                BuildCustomDetailsStrip(
                  label: "Product Description",
                  labelDetails: _productData.productDescription,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildProductImage extends StatelessWidget {
  const BuildProductImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(180),
      width: SizeConfig.screenWidth,
      child: ClipRRect(
        borderRadius:
            BorderRadius.all(Radius.circular(getProportionateScreenHeight(30))),
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BuildCustomDetailsStrip extends StatelessWidget {
  final String? _label;
  final String? _labelDetails;
  const BuildCustomDetailsStrip({
    Key? key,
    String? label,
    String? labelDetails,
  })  : _label = label,
        _labelDetails = labelDetails,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.screenWidth * 0.31,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              Text(
                _label!,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              Text(
                _labelDetails!,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
