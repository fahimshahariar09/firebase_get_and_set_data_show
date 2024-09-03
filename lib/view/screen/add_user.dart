import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/controller/firebase_getx/user/add_user.dart';
import 'package:firebase/view/screen/common_widget/common_button.dart';
import 'package:firebase/view/screen/widget/name_text_field.dart';
import 'package:firebase/view/screen/widget/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    AddUserController addUserController = Get.put(AddUserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            NameTextField(nameController: addUserController.nameController),
            const SizedBox(
              height: 10,
            ),
            PasswordTextField(
              passwordController: addUserController.passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => addUserController.isLoading.isTrue
                  ? const CircularProgressIndicator()
                  : CommonButton(
                      buttonName: "Add User",
                      onTap: () {
                        addUserController.adduserFun();
                      }),
            ),
            const SizedBox(
              height: 30,
            ),
            CommonButton(
                buttonName: "Get data",
                onTap: () {
                  addUserController.getallUserFun();
                }),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: addUserController.userList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              "${addUserController.userList[index]["name"]}"),
                          subtitle: Text(
                              "${addUserController.userList[index]['password']}"),
                        );
                      }),
                )),
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("user").snapshots(),
                builder: (context, s) {
                  if (s.hasError) {
                    return const Text("error");
                  } else if (s.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (s.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: s.data?.docs.length ?? 0,
                          itemBuilder: (context, index) {
                            log(".............${s.data?.docs[index].data()['phone']}");
                            return ListTile(
                              title:
                                  Text("${s.data?.docs[index].data()["name"]}"),
                              subtitle: Text(
                                  "${s.data?.docs[index].data()['password']}"),
                            );
                          }),
                    );
                  }
                  return const Text("data");
                })
          ],
        ),
      ),
    );
  }
}
