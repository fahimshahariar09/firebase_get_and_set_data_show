import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/controller/firebase_api/user/add_user.dart';
import 'package:firebase/controller/firebase_api/user/get_all_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  adduserFun() async {
    log("..................sure.............................");
    isLoading.value=true;
  bool status =  await AddUserService.adduserService(
        name: nameController.text, password: passwordController.text);
    isLoading.value=false;



    if(status){
      nameController.clear();
      passwordController.clear();
    }
    log("..................ses.............................");
  }



  getallUserFun()async{
    QuerySnapshot<Map<String,dynamic>>? data =  await GetAllUserService.getalluserService();



    if(data != null){
      log("................lenth :${data.docs.length}");
    }
  }

}
