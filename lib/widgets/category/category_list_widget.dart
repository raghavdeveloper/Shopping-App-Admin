import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_admin/services/firebase_services.dart';
import 'package:shopping_app_admin/widgets/category/category_card_widget.dart';
import 'package:shopping_app_admin/widgets/category/category_upload_widget.dart';

class CategoryListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseServices _services = FirebaseServices();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: _services.category.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong...'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Wrap(
            direction: Axis.horizontal,
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return CategoryCard(document);
            }).toList(),
          );
        },
      ),
    );
  }
}
