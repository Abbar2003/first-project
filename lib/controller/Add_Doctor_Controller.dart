import 'dart:convert';
import 'dart:developer';

import 'package:admin2/components/Snackbar.dart';
import 'package:admin2/components/basic%20components/Get_Dialog.dart';
import 'package:admin2/main.dart';
import 'package:admin2/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AddDoctorController extends GetxController {
  final form_key = GlobalKey<FormState>();
  final key = GlobalKey<FormState>();
  final full_name = TextEditingController();
  final email = TextEditingController();
  final email2 = TextEditingController();
  late final String x;
  void Add_Doctor() async {
    if (form_key.currentState!.validate()) {
      form_key.currentState!.save();
      try {
        final url = Uri.parse("http://127.0.0.1:8000/api/register_doctor");

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
           const GetDialog(text: 'Doctor Added Succefully',path: 'assets/images/true.png',)
          );
          
        } else {
          log("Error ${response.statusCode}");
        }
      } catch (e) {
        log(e.toString());
      }
    } else {
      print('ssssss');
      return;
    }
  }

  

  

  appoitmentDoctor(int subject_id) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        final url = Uri.parse("http://127.0.0.1:8000/api/appointment-doctor");

        final response = await http.post(url, body: {
          "email": email2.text,
          'subject_id': '$subject_id'
        }, headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        });
        final decodedResponse = json.decode(response.body);
        log(decodedResponse);
        if (decodedResponse["status"] == 201) {
          log(decodedResponse);
          Get.back();
          snackBar sb = snackBar(
            path: 'assets/images/check.png',
            BorderColor: Colors.greenAccent,
            message: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Successfully!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Doctor appoitmented',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.mediaQuery.size.width / 25,
                ),
              ),
            ),
          );
          sb.snackbar();
        } else {
          log("Error ${response.statusCode}");
        }
      } catch (e) {
        log(e.toString());
      }
    } else {
      print('ssssss');
      return;
    }
  }
}
