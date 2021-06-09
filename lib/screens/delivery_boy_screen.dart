import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shopping_app_admin/screens/order_screen.dart';
import 'package:shopping_app_admin/services/firebase_services.dart';
import 'package:shopping_app_admin/services/sideBar.dart';
import 'package:shopping_app_admin/widgets/deliveryboy/approved_boys.dart';
import 'package:shopping_app_admin/widgets/deliveryboy/create_deliveryboy.dart';
import 'package:shopping_app_admin/widgets/deliveryboy/new_boys.dart';

class DeliveryBoyScreen extends StatelessWidget {
  static const String id = 'deliveryBoy-screen';

  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();

    return DefaultTabController(
      length: 2,
      child: AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: const Text('Shopping App Dashboard',
              style: TextStyle(color: Colors.white)),
        ),
        sideBar: _sideBar.sideBarMenus(context, DeliveryBoyScreen.id),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Boys',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                Text('Create new Delivery Boys Abd Manage All Delivery Boys'),
                Divider(
                  thickness: 5,
                ),
                CreateNewBoyWidget(),
                Divider(
                  thickness: 5,
                ),
                //list of delivery boy
                TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(
                      text: 'NEW',
                    ),
                    Tab(
                      text: 'UN PUBLISHED',
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: [NewBoys(), ApprovedBoys()],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
