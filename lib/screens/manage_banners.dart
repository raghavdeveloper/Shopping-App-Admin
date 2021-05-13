import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shopping_app_admin/services/sideBar.dart';
import '../widgets/banner/banner_upload_widget.dart';
import '../widgets/banner/banner_widget.dart';

import 'home_screen.dart';

class BannerScreen extends StatelessWidget {
  static const String id = 'banner-screen';

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
      sideBar: _sideBar.sideBarMenus(context, BannerScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BannerScreen',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              Text('Add/Delete Home Screen Banner Images'),
              Divider(
                thickness: 5,
              ),
              //Banners
              BannerWidget(),
              Divider(
                thickness: 5,
              ),
              BannerUploadWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
