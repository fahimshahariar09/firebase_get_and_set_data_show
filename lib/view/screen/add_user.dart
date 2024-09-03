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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => addUserController.isLoading.isFalse
                      ? CommonButton(
                          buttonName: "Add User",
                          onTap: () {
                            addUserController.adduserFun();
                          })
                      : CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 30,
                ),
                CommonButton(
                    buttonName: "Get data",
                    onTap: () {
                      addUserController.getallUserFun();
                    }),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                  return ListTile(
                   // title: t,
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
