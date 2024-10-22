import 'dart:developer';
import 'package:admin2/api.dart';
import 'package:admin2/components/Themes.dart';
import 'package:admin2/main.dart';
import 'package:admin2/views/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginAdminController extends GetxController {
  final form_key = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool isSecurePasswordConfirm = false;
  Widget? circle;
  void login_admin() async {
    if (form_key.currentState!.validate()) {
      form_key.currentState!.save();
      circle = const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      );
      update();
      try {
        final data = {
          "email": email.text,
          "password": password.text,
        };
        final decodedResponse =
            await await Api.post_request_without_token("login-admin", data);

        if (decodedResponse["status"] == 200) {
          Auth!.setString('token', "${decodedResponse["data"]["token"]}");

          Get.offAll(() => const HomePage());
        } else {
          Get.dialog(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Material(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Warning",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Invalid email or password",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            //Buttons
                            const SizedBox(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                foregroundColor: const Color(0xFFFFFFFF),
                                backgroundColor: const Color(0xff6EC17D),
                                minimumSize: const Size(25, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'OK',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        circle = null;
        update();
      } catch (e) {
        log(e.toString());
      }
    } else {
      return;
    }
  }

  Widget toggleConfirmPassWord() {
    return IconButton(
      onPressed: () {
        isSecurePasswordConfirm = !isSecurePasswordConfirm;
        update();
      },
      icon: isSecurePasswordConfirm
          ? Image(
              image: const AssetImage('assets/images/eye.png'),
              width: 28,
              height: 28,
              color: Get.isDarkMode
                  ? Themes.darkColorScheme.primary
                  : Themes.colorScheme.primary,
            )
          : Image(
              image: const AssetImage('assets/images/show.png'),
              width: 28,
              height: 28,
              color: Get.isDarkMode
                  ? Themes.darkColorScheme.primary
                  : Themes.colorScheme.primary,
            ),
    );
  }
}
