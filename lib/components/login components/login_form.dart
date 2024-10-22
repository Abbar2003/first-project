import 'package:admin2/controller/login_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginAdminController());

    return Form(
      key: controller.form_key,
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width / 1.6,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFFE2D3F5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontFamily: 'PlaywriteCU'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 150, top: 40),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "email required";
                  }
                  int index = 0;
                  for (int i = 0; i < value.length; i++) {
                    if (value[i] == '@') {
                      index = i;
                      break;
                    }
                  }
                  String email = value.substring(0, index);
                  if (int.tryParse(email) != null ||
                      double.tryParse(email) != null ||
                      email.length < 5) {
                    return "invalid email";
                  }
                  return null;
                },
                onSaved: (email) {
                  controller.email.text = email!;
                },
                decoration: const InputDecoration(
                  hintText: "Your email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, right: 150, top: 20),
              child: GetBuilder<LoginAdminController>(builder: (controllera) {
                return TextFormField(
                  onSaved: (pass) {
                    controller.password.text = pass!;
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "password missing";
                    }
                    if (value.trim().length < 8) {
                      return "password too short";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isSecurePasswordConfirm,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    suffixIcon: controller.toggleConfirmPassWord(),
                    hintText: "Your password",
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 60),
            Hero(
              tag: "login_btn",
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: GetBuilder<LoginAdminController>(builder: (aController) {
                  return MaterialButton(
                    color: kPrimaryColor,
                    minWidth: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 12.5,
                    onPressed: () => controller.login_admin(),
                    child: controller.circle ??
                        Text(
                          "Login".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                  );
                }),
              ),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
