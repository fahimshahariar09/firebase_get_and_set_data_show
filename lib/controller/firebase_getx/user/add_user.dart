

import 'package:firebase/controller/firebase_api/user/add_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddUserController extends GetxController{

  TextEditingController nameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  RxBool isLoading =false.obs;

  adduserFun()async{
    await AddUserService.adduserService(name: nameController.text, password: passwordController.text);
  }




}