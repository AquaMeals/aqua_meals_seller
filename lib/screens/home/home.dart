import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatelessWidget {
  static const String homePageRoute = "/home";
  const Home({Key? key}) : super(key: key);

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
              children: [
                SizedBox(
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    animation: true,
                    animationDuration: 500,
                    percent: 1,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).primaryColor,
                    center: const Text(
                      "70.0%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Text(
                      "Confirmed Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
                SizedBox(
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    animation: true,
                    animationDuration: 500,
                    percent: 0.3,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).primaryColor,
                    center: const Text(
                      "30.0%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Text(
                      "Pending Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    animation: true,
                    animationDuration: 500,
                    percent: 0.7,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).primaryColor,
                    center: const Text(
                      "70.0%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Text(
                      "Total Products",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
                SizedBox(
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    animation: true,
                    animationDuration: 500,
                    percent: 0.3,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).primaryColor,
                    center: const Text(
                      "30.0%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: const Text(
                      "Total Sales",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
