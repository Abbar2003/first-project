import 'dart:convert';
import 'dart:developer';

import 'package:admin2/api.dart';
import 'package:admin2/components/basic%20components/Get_Dialog.dart';
import 'package:admin2/main.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class TheoreticalController extends GetxController {
  dynamic decodedRes;
  getTheoretical() async {
    try {
      final decodedResponse = await Api.get_request("subjects-theoretical");
      if (decodedResponse["status"] == 200) {
        decodedRes = decodedResponse;
        return decodedRes;
      } else {
        log("Error !");
      }
    } catch (e) {
      log(e.toString());
    }
  }
  deleteDoctor(String email, int subject_id) async {
    try {
      var response = await http.post(
          Uri.parse('http://127.0.0.1:8000/api/cancel-doctor-for-subject'),
          body: {
            "email": email,
            'subject_id': '$subject_id'
          },
          headers: {
            "Authorization": "Bearer ${Auth!.getString('token')}",
          });
      final decodedResponse = json.decode(response.body);
      if (decodedResponse["status"] == 200) {
       Get.dialog(GetDialog(text: 'Doctor canceled Succfully', path: 'assets/images/true.png'));
        return decodedResponse;
      } else {
        log("Error ${response.statusCode}");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}