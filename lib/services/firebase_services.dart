//@dart=2.9

import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference banners = FirebaseFirestore.instance.collection('slider');
  CollectionReference shops = FirebaseFirestore.instance.collection('shops');
  CollectionReference boys = FirebaseFirestore.instance.collection('boys');
  CollectionReference category =
      FirebaseFirestore.instance.collection('category');
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<DocumentSnapshot> getAdminCredentials(id) {
    var result = FirebaseFirestore.instance.collection('Admin').doc(id).get();
    return result;
  }

  //Banner
  Future<String> uploadBannerImageToDb(url) async {
    String downloadUrl = await storage.ref(url).getDownloadURL();
    if (downloadUrl != null) {
      firestore.collection('slider').add({
        'image': downloadUrl,
      });
    }
    return downloadUrl;
  }

  deleteBannerImageFromDb(id) async {
    firestore.collection('slider').doc(id).delete();
  }

  //Category
  Future<String> uploadCategoryImageToDb(url, catName) async {
    String downloadUrl = await storage.ref(url).getDownloadURL();
    if (downloadUrl != null) {
      category.doc(catName).set({
        'image': downloadUrl,
        'name': catName,
      });
    }
    return downloadUrl;
  }

  //Shopper
  updateShopAccStatus({id, status}) async {
    shops.doc(id).update({'accVerified': status ? false : true});
  }

  updateShopPickStatus({id, status}) async {
    shops.doc(id).update({'isTopPicked': status ? false : true});
  }

  Future<void> confirmDeleteDialog({title, message, context, id}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('DELETE'),
              onPressed: () {
                deleteBannerImageFromDb(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showMyDialog({title, message, context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> saveDeliveryBoys(email, password) async {
    boys.doc(email).set({
      'accVerified': false,
      'address': '',
      'email': email,
      'imageUrl': '',
      'location': GeoPoint(0, 0),
      'mobile': '',
      'name': '',
      'password': password,
      'uid': ''
    });
  }

  //update delivery boy approved status

  updateBoyStatus({id, context, status}) {
    ArsProgressDialog progressDialog = ArsProgressDialog(context,
        blur: 2,
        backgroundColor: Color(0xFF84c225).withOpacity(.3),
        animationDuration: Duration(milliseconds: 500));
    progressDialog.show();
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('boys').doc(id);
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);

      if (!snapshot.exists) {
        throw Exception('User does not exists!');
      }

      transaction.update(documentReference, {'accVerified': status});
    }).then((value) {
      progressDialog.dismiss();
      showMyDialog(
          title: 'Delivery Boy Status',
          message: status == true
              ? 'Delivery boy approved status updated as Approved'
              : 'Delivery boy approved status updated as Not Approved',
          context: context);
    }).catchError((error) => showMyDialog(
        title: 'Delivery Boy Status',
        message: 'Failed to update delivery boy status $error',
        context: context));
  }
}
