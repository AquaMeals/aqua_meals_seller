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
    String? imageUrl =
        "https://images.pexels.com/photos/302743/pexels-photo-302743.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
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
              // MyProductsTile(imageUrl: imageUrl)
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
        padding: const EdgeInsets.only(top: 15.0),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          // height: 120,
          // decoration: const BoxDecoration(color: Colors.amber),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  _productData.productImageUrl!,
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // "Silver Pomfret",
                          _productData.productName!,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rs ${_productData.regularPrice}/Kilogram",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _productData.productDescription!,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
