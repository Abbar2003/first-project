// ignore_for_file: non_constant_identifier_names, missing_required_param

import 'dart:convert';
import 'dart:developer';

import 'package:admin2/components/Snackbar.dart';
import 'package:admin2/components/Themes.dart';
import 'package:admin2/components/basic%20components/Get_Dialog.dart';
import 'package:admin2/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';

class ChangePassController extends GetxController {
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirm_password = TextEditingController();
   bool isSecurePasswordConfirm = false ;


  final formkey = GlobalKey<FormState>();
  Widget? circle;
  void onChangePass() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      circle = const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      );
      update();
      // reset password doctor :
      try {
        // email url :
        var url = Uri.parse('http://127.0.0.1:8000/api/reset-password-admin');
        var response = await http.post(
          url,
          headers: {
            "Authorization": "Bearer ${Auth!.getString('token')}",
          },
          body: {
            'old_password': oldPass.text,
            'new_password': newPass.text,
            "confirm_password": confirm_password.text,
          },
        );
        // decoded response :
        final decodedResponse = json.decode(response.body);
        if (decodedResponse["status"] == 200) {
           Get.to(() => HomePage());
          Get.dialog(
           const GetDialog(text: 'Password Changed Succefully',path: 'assets/images/true.png',)
          );
          
        }
        // wrong confirm pass :
        else if (decodedResponse["status"] == 401) {
          snackBar sb = snackBar(
            path: 'assets/images/cross.png',
            BorderColor: Colors.redAccent,
            message: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Confirm new password and new password isn`t the same.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 30,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Error!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
          );
          sb.snackbar();
        }
        // some thing went wrong :
        else if (decodedResponse["status"] == 400) {
          snackBar sb = snackBar(
            path: 'assets/images/cross.png',
            BorderColor: Colors.redAccent,
            message: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Wrong Password.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Error!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
          );
          sb.snackbar();
        } else {
          snackBar sb = snackBar(
            path: 'assets/images/cross.png',
            BorderColor: Colors.redAccent,
            message: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'SomeThing Went Wrong.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Error!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                )
              ),
            ),
          );
          sb.snackbar();
        }
        circle = null;
        update();
        Get.offAll(() => HomePage());
      } catch (e) {
        log('errrrrorrr');
      }
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
              color: Get.isDarkMode ?
                Themes.darkColorScheme.primary:
                Themes.colorScheme.primary,
            )
          : Image(
              image: const AssetImage('assets/images/show.png'),
              width: 28,
              height: 28,
              color: Get.isDarkMode?
                Themes.darkColorScheme.primary:
                Themes.colorScheme.primary,
            ),
    );
  }
}
