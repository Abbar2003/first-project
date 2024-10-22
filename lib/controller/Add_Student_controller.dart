import 'dart:convert';
import 'dart:developer';

import 'package:admin2/components/Snackbar.dart';
import 'package:admin2/components/basic%20components/Get_Dialog.dart';
import 'package:admin2/main.dart';
import 'package:admin2/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


class AddStudentController extends GetxController {
  final form_key = GlobalKey<FormState>();
  final full_name = TextEditingController();
  final email = TextEditingController();

  void Add_Stusent() async {
    if (form_key.currentState!.validate()) {
      form_key.currentState!.save();
      try {
        final url = Uri.parse("http://127.0.0.1:8000/api/register-student");

        final response = await http.post(url, body: {
          "full_name": full_name.text,
          "email": email.text,
        }, headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        });
        final decodedResponse = json.decode(response.body);

        if (decodedResponse["status"] == 201) {
       Get.to(() => HomePage());
          Get.dialog(
           const GetDialog(text: 'Student Added Succefully',path: 'assets/images/true.png',)
          );
          
          
        } else {
          log("Error ${response.statusCode}");
        }
      } catch (e) {
        log(e.toString());
      }
    } 
    else {
      return;
    }
  }
}
