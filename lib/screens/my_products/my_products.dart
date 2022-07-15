import 'package:aqua_meals_seller/crud/crud.dart';
import 'package:aqua_meals_seller/crud/general_methods.dart';
import 'package:aqua_meals_seller/models/products.dart';
import 'package:aqua_meals_seller/widgets/build_price_lebel_with_unit.dart';
import 'package:aqua_meals_seller/screens/product_details/product_details.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyProducts extends StatelessWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CRUD _crudOperations = CRUD();
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text("My Products"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: FutureBuilder(
            future: _crudOperations.fetchProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Error"));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return MyProductsTile(
                      productData: snapshot.data[index],
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class MyProductsTile extends StatelessWidget {
  final Products _productData;
  const MyProductsTile({Key? key, productData})
      : _productData = productData,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(
                      productData: _productData,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
        child: Container(
          width: SizeConfig.screenWidth,
          height: getProportionateScreenHeight(90),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(10))),
          ),
          child: Row(
            children: [
              CardImage(
                tag: _productData.productID.toString(),
                imageURL: _productData.productImageUrl!.toString(),
              ),
              SizedBox(width: getProportionateScreenWidth(15)),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(right: getProportionateScreenWidth(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getProportionateScreenHeight(8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _productData.productName!.capitalize(),
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(15),
                            ),
                          ),
                          BuildPriceLebelWithUnit(
                            regularPrice: _productData.regularPrice,
                            discountedPrice: _productData.discountedPrice,
                            unit: _productData.unit,
                            largeTextFontSize: getProportionateScreenWidth(15),
                            smallTextFontSize: getProportionateScreenWidth(11),
                          ),
                          // Text(
                          //   _productData.discountedPrice!.isEmpty
                          //       ? "Rs ${_productData.regularPrice}/${_productData.unit}"
                          //       : "Rs ${_productData.discountedPrice}/${_productData.unit}",
                          //   style: TextStyle(
                          //     color: Theme.of(context).primaryColor,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(5)),
                      Expanded(
                        child: Text(
                          _productData.productDescription!.capitalize(),
                          maxLines: 3,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String? _tag;
  final String? _imageURL;
  const CardImage({Key? key, String? tag, required String? imageURL})
      : _tag = tag,
        _imageURL = imageURL,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _imageURL!.isNotEmpty
        ? Hero(
            tag: _tag!,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(getProportionateScreenWidth(10))),
              child: CachedNetworkImage(
                imageUrl: _imageURL!,
                key: UniqueKey(),
                width: getProportionateScreenHeight(90),
                height: getProportionateScreenHeight(90),
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            width: getProportionateScreenHeight(90),
            height: getProportionateScreenHeight(90),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
