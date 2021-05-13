import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shopping_app_admin/screens/admin_users.dart';
import 'package:shopping_app_admin/screens/category_screen.dart';
import 'package:shopping_app_admin/screens/home_screen.dart';
import 'package:shopping_app_admin/screens/login_screen.dart';
import 'package:shopping_app_admin/screens/manage_banners.dart';
import 'package:shopping_app_admin/screens/notification_screen.dart';
import 'package:shopping_app_admin/screens/order_screen.dart';
import 'package:shopping_app_admin/screens/settings_screen.dart';
import 'package:shopping_app_admin/screens/shop_screen.dart';

class SideBarWidget {
  sideBarMenus(context, selectedRoute) {
    return SideBar(
      activeBackgroundColor: Colors.black54,
      activeIconColor: Colors.white,
      activeTextStyle: TextStyle(color: Colors.white),
      items: const [
        MenuItem(
          title: 'Dashboard',
          route: HomeScreen.id,
          icon: Icons.dashboard,
        ),
        MenuItem(
          title: 'Banners',
          route: BannerScreen.id,
          icon: CupertinoIcons.photo,
        ),
        MenuItem(
          title: 'Shops',
          route: ShopScreen.id,
          icon: CupertinoIcons.group_solid,
        ),
        MenuItem(
          title: 'Categories',
          route: CategoryScreen.id,
          icon: Icons.category,
        ),
        MenuItem(
          title: 'Orders',
          route: OrderScreen.id,
          icon: CupertinoIcons.cart_fill,
        ),
        MenuItem(
          title: 'Send Notification',
          route: NotificationScreen.id,
          icon: Icons.notifications,
        ),
        MenuItem(
          title: 'Admin Users',
          route: AdminUsers.id,
          icon: Icons.person_rounded,
        ),
        MenuItem(
          title: 'Settings',
          route: SettingScreen.id,
          icon: Icons.settings,
        ),
        MenuItem(
          title: 'Exit',
          route: HomeScreen.id,
          icon: Icons.exit_to_app,
        ),
      ],
      selectedRoute: selectedRoute,
      onSelected: (item) {
        if (item.route != null) {
          Navigator.of(context).pushNamed(item.route);
        }
      },
      header: Container(
        height: 50,
        width: double.infinity,
        color: Color(0xff444444),
        child: Center(
          child: Text(
            'MENU',
            style: TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      footer: Container(
        height: 50,
        width: double.infinity,
        color: Colors.black26,
        child: Center(
          child: Image.asset(
            'images/logo.png',
            height: 30,
          ),
        ),
      ),
    );
  }
}
