import 'package:aqua_meals_seller/screens/add_Products/add_product_form.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      bottom: false,
      top: true,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBody: true,
          drawer: const MyDrawer(),
          appBar: AppBar(
            title: const Text("Add Product"),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Column(
                  children: const [
                    AddProductForm(),
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
