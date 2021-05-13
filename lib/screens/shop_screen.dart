import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shopping_app_admin/services/sideBar.dart';
import '../widgets/shop/shops_datatable_widget.dart';

class ShopScreen extends StatefulWidget {
  static const String id = 'shop-screen';
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  SideBarWidget _sideBar = SideBarWidget();

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Shopping App Dashboard',
            style: TextStyle(color: Colors.white)),
      ),
      sideBar: _sideBar.sideBarMenus(context, ShopScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Shops',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              Text('Manage all the Shops Activities'),
              Divider(
                thickness: 5,
              ),
              ShopsDataTable(),
              Divider(
                thickness: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
