//@dart=2.9

import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_admin/screens/admin_users.dart';
import 'package:shopping_app_admin/screens/category_screen.dart';
import 'package:shopping_app_admin/screens/delivery_boy_screen.dart';
import 'package:shopping_app_admin/screens/login_screen.dart';
import 'package:shopping_app_admin/screens/manage_banners.dart';
import 'package:shopping_app_admin/screens/notification_screen.dart';
import 'package:shopping_app_admin/screens/order_screen.dart';
import 'package:shopping_app_admin/screens/settings_screen.dart';
import 'package:shopping_app_admin/screens/shop_screen.dart';
import 'package:shopping_app_admin/screens/splash_screen.dart';

import 'screens/home_screen.dart';
import 'services/firebase_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App Admin Dashboard',
      theme: ThemeData(
        primaryColor: Color(0xFF84c225),
      ),
      home: SplashScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        //  LoginScreen.id: (context) => LoginScreen(),
        BannerScreen.id: (context) => BannerScreen(),
        CategoryScreen.id: (context) => CategoryScreen(),
        OrderScreen.id: (context) => OrderScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
        AdminUsers.id: (context) => AdminUsers(),
        SettingScreen.id: (context) => SettingScreen(),
        ShopScreen.id: (context) => ShopScreen(),
        DeliveryBoyScreen.id: (context) => DeliveryBoyScreen(),
      },
    );
  }
}
