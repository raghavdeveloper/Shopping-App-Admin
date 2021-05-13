import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shopping_app_admin/services/sideBar.dart';

class SettingScreen extends StatelessWidget {
  static const String id = 'settings-screen';
  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();
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
      sideBar: _sideBar.sideBarMenus(context, SettingScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Text(
            'Setting Screen',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
