import 'package:aqua_meals_seller/crud/crud.dart';
import 'package:aqua_meals_seller/models/products.dart';
import 'package:aqua_meals_seller/screens/product_details/product_details.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
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
            color: Theme.of(context).primaryColor.withOpacity(0.13),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Hero(
                tag: _productData.productID.toString(),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    _productData.productImageUrl!,
                    width: getProportionateScreenHeight(90),
                    height: getProportionateScreenHeight(90),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(15)),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(right: getProportionateScreenWidth(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _productData.productName![0].toUpperCase() +
                                  _productData.productName!.substring(1),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _productData.discountedPrice!.isEmpty
                                  ? "Rs ${_productData.regularPrice}/${_productData.unit}"
                                  : "Rs ${_productData.discountedPrice}/${_productData.unit}",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: getProportionateScreenHeight(5)),
                          child: Text(
                            _productData.productDescription!,
                            maxLines: 3,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.7),
                            ),
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
