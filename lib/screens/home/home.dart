import 'package:aqua_meals_seller/crud/crud.dart';
import 'package:aqua_meals_seller/screens/home/build_circular_percentage_indicator.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String homePageRoute = "/home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Products> _productsList = [];
  final CRUD crudOperations = CRUD();
  Stream<QuerySnapshot>? myProductsStream;

  @override
  void initState() {
    myProductsStream = crudOperations.fetchMyProductsStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      bottom: false,
      top: true,
      child: Scaffold(
        extendBody: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BuildCircularPercentageIndicator(
                  centerText: "70.0%",
                  bottomLabel: "Confirmed Orders",
                  percentage: 0.9,
                ),
                BuildCircularPercentageIndicator(
                  centerText: "30.0%",
                  bottomLabel: "Pending Orders",
                  percentage: 0.3,
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StreamBuilder(
                  stream: crudOperations.fetchMyProductsStream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      List myproductsList = [];
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        myproductsList.add(snap.data());
                      }
                      // print(myproducts[0]['unit']);
                      return BuildCircularPercentageIndicator(
                        centerText: "${myproductsList.length}",
                        bottomLabel: "Total Products",
                        percentage: myproductsList.length / 100,
                      );
                    }
                  },
                ),
                StreamBuilder(
                  stream: crudOperations.fetchMyProductsStream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      List myproducts = [];
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        myproducts.add(snap.data());
                      }
                      // print(myproducts[0]['unit']);
                      return BuildCircularPercentageIndicator(
                        centerText: "${myproducts.length}",
                        bottomLabel: "Total Sales",
                        percentage: myproducts.length / 100,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
