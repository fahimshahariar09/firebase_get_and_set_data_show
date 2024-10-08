import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserService {
  static Future adduserService(
      {required String name, required String password}) async {
    try {
      var data = {"name": name, "password": password};

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var date = DateTime.now();
      await firebaseFirestore.collection("user").doc(date.toString().substring(0,10)).collection("collectionPath").add(data);
      return true;
    } catch (e) {
      log("error :$e");
    }
    return false;
  }
}
