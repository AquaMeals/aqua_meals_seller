import 'package:aqua_meals_seller/helper/tab_bar.dart';
import 'package:aqua_meals_seller/screens/my_orders/pending_orders.dart';
import 'package:aqua_meals_seller/size_configuration.dart';
import 'package:aqua_meals_seller/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Orders extends StatefulWidget {
  static const String ordersRoute = "/ordersRoute";
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
  final List<Widget> _tabBarViews = const [
    PendingOrders(),
    Center(child: Text("Confirmed")),
  ];
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: _tabBarViews.length,
      vsync: this,
      initialIndex: tabBarIndex!,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Orders"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              _tabBarOptionWidget(
                  icon: MdiIcons.clipboardClockOutline,
                  label: "Pending Orders"),
              _tabBarOptionWidget(
                  icon: MdiIcons.clipboardCheckOutline,
                  label: "Confirmed Orders"),
            ],
            onTap: (newTabIndex) {
              setState(() {
                tabBarIndex = newTabIndex;
              });
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabBarViews,
        ),
      ),
    );
  }

  Widget _tabBarOptionWidget(
      {required IconData? icon, required String? label}) {
    return Column(
      children: [
        Icon(icon),
        Text(label!),
        const SizedBox(height: 5),
      ],
    );
  }
}
