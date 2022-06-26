import 'package:aqua_meals_seller/screens/order_details/order_details.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Orders"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return const MyOrdersTile();
            },
          ),
        ),
      ),
    );
  }
}

class MyOrdersTile extends StatelessWidget {
  const MyOrdersTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const OrderDetails())));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          width: SizeConfig.screenWidth,
          height: 90,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.25),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenHeight(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Silver Pomfret",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2 kilogram",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Rs 1150/-",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Flexible(
                      child: Text(
                        "Areeb Uz Zaman Siddiqui",
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  children: [
                    Text(
                      "Address:",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Flexible(
                      child: Text(
                        "Lorem Ipsum is that it has a more or less normal distribution of letters, as opposed",
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
