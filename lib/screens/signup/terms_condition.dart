import 'package:aqua_meals_seller/crud/crud.dart';
import 'package:aqua_meals_seller/models/terms_and_condition.dart';
import 'package:aqua_meals_seller/screens/check_login.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class TermsAndCondition extends StatefulWidget {
//   static const String? routeName = "/TermsAndCondition";

//   const TermsAndCondition({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TermsAndCondition> createState() => _TermsAndConditionState();
// }

// class _TermsAndConditionState extends State<TermsAndCondition> {
//   bool isLoading = true;
//   @override
//   void initState() {
//     getTermsAndConditionsData();
//     super.initState();
//   }

//   getTermsAndConditionsData() async {
//     setState(() {
//       isLoading = true;
//     });
//     await CRUD().fetchTermsAndConditions();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Theme.of(context).primaryColor,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Column(
//                 children: [
//                   const WaveLogoHeader(),
//                   SizedBox(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: getProportionateScreenWidth(20)),
//                       child: isLoading
//                           ? const Center(
//                               child: CircularProgressIndicator(
//                                   color: Colors.white))
//                           : Column(
//                               children: [
//                                 const HeaderText(
//                                   firstText: "Terms & Condition",
//                                   lastText:
//                                       "Please read these terms & conditions carefully before using the Aqua Meal application.",
//                                 ),
//                                 SizedBox(
//                                     height: getProportionateScreenHeight(20)),
//                                 TitleWithDescription(
//                                   // title: "Profile Approval",
//                                   title:
//                                       "This is Data ${TermsAndConditionModel.getFirstTitle}",
//                                   // prefixIcon: Icons.approval_outlined,
//                                   description:
//                                       "Seller profile will be approve within 24 working hours after validating the seller's provided profile information. After confirmation, sellers can be able to upload their product and can take orders.",
//                                 ),
//                                 SizedBox(
//                                     height: getProportionateScreenHeight(20)),
//                                 const TitleWithDescription(
//                                   title: "Order or Delivery Available",
//                                   // prefixIcon: Icons.location_off_outlined,
//                                   description:
//                                       "The delivery is only available within the karachi city, orders placing and delivery can not happen out of the mentioned city.",
//                                 ),
//                                 SizedBox(
//                                     height: getProportionateScreenHeight(10)),
//                                 const TitleWithDescription(
//                                   title: "Delivery Charges",
//                                   // prefixIcon: Icons.delivery_dining_outlined,
//                                   description:
//                                       "The 200 rupees will be applied to each order as a delivery charges that will be added to the total amount of the order placed by the buyer within the location of Karachi.",
//                                 ),
//                                 SizedBox(
//                                     height: getProportionateScreenHeight(10)),
//                                 const TitleWithDescription(
//                                   title: "Aqua Meal Fee Deduction",
//                                   // prefixIcon: MdiIcons.cashMinus,
//                                   description:
//                                       "For the seller, 10% amount from each order of the seller will be deducted by Aqua Meals as a Fee from the total amount of the order except delivery charges.\n\nfor example: if the total price of the order without delivery charges is 1000 rupees so 1000 x 10% = 100 rupees rupees will be deducted.",
//                                 ),
//                                 SizedBox(
//                                     height: getProportionateScreenHeight(10)),
//                               ],
//                             ),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: getProportionateScreenHeight(50),
//                 width: SizeConfig.screenWidth,
//                 alignment: Alignment.centerLeft,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: getProportionateScreenWidth(20)),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.arrow_back_rounded,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class TitleWithDescription extends StatelessWidget {
  final String? _title, _description;
  // final IconData? _prefixIcon;
  const TitleWithDescription({
    Key? key,
    required String? title,
    required String? description,
    // required IconData? prefixIcon,
  })  : _title = title,
        _description = description,
        // _prefixIcon = prefixIcon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _title!,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(15),
          ),
        ),
        Text(
          _description!,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: getProportionateScreenWidth(15),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}

class TermsAndCondition extends StatefulWidget {
  static const String? routeName = "/TermsAndCondition";

  const TermsAndCondition({
    Key? key,
  }) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  // bool isLoading = true;
  // @override
  // void initState() {
  //   getTermsAndConditionsData();
  //   super.initState();
  // }

  // getTermsAndConditionsData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   await CRUD().fetchTermsAndConditions();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    CollectionReference query =
        FirebaseFirestore.instance.collection('terms and condition');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const WaveLogoHeader(),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Column(
                        children: [
                          const HeaderText(
                            firstText: "Terms & Condition",
                            lastText:
                                "Please read these terms & conditions carefully before using the Aqua Meal application.",
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          FutureBuilder<QuerySnapshot>(
                            future: query.get(),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text("Found Error");
                              }

                              // if (snapshot.hasData && !snapshot.data!.exists) {
                              //   return const Text("Document does not exist");
                              // }

                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Map<String, dynamic> data =
                                    snapshot.data! as Map<String, dynamic>;
                                // snapshot.data;
                                // print(data);
                                return TitleWithDescription(
                                  title: data["title"].toString(),
                                  // prefixIcon: Icons.approval_outlined,
                                  description: data["description"],
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
                            },
                          ),
                          // SizedBox(height: getProportionateScreenHeight(10)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: getProportionateScreenHeight(50),
                width: SizeConfig.screenWidth,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
