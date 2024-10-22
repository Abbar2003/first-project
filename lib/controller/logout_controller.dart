import 'dart:convert';
import 'dart:math';

import 'package:admin2/components/Snackbar.dart';
import 'package:admin2/main.dart';
import 'package:admin2/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class LogoutController extends GetxController{

  void logout() async{
    try{
      final url = Uri.parse("http://127.0.0.1:8000/api/logout-admin");

      final response  = await http.get(url ,headers: {
          "Authorization": "Bearer ${Auth!.getString('token')}",
        });
      final decodedResponse = json.decode(response.body);

      if(decodedResponse["status"] == 200){
        Get.to(() => LoginScreen());
        
      }
      else{
        log(Error as num);
      }
    }catch(e){
      log(e.toString() as num);
    }
    }

  }
