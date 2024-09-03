

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class GetAllUserService{

  static Future<QuerySnapshot<Map<String,dynamic>>?>
  getalluserService()async{

    try{

      FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;
      var date =DateTime.now();
      QuerySnapshot<Map<String,dynamic>> get = await firebaseFirestore.collection("user").doc(date.toString().substring(0,10)).collection("collectionPath").get();

      log(" data.............$get");
      log(".........data ${get.docs.length}");

      return get;
    }catch (e){log("error :$e");}
    return null;

  }

}