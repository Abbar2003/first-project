// ignore_for_file: file_names

import 'dart:developer';
import 'dart:typed_data';

import 'package:admin2/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCourseController extends GetxController {
  final form_key_course_name = GlobalKey<FormState>();
  final form_key_auther_name = GlobalKey<FormState>();
  final form_key_discreption = GlobalKey<FormState>();

  final course_name = TextEditingController();
  final auther_name = TextEditingController();
  final discreption = TextEditingController();

  List<Map> links = [];
  Uint8List? image;

  List<List<TextEditingController>> videos = [
    [TextEditingController(), TextEditingController(), TextEditingController()],
    [TextEditingController(), TextEditingController(), TextEditingController()],
  ];

  List<List<GlobalKey<FormState>>> videos_validation = [
    [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()],
    [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()],
  ];

  validate_data() {
    if (form_key_course_name.currentState!.validate() &&
        form_key_auther_name.currentState!.validate() &&
        form_key_discreption.currentState!.validate()) {
      form_key_course_name.currentState!.save();
      form_key_auther_name.currentState!.save();
      form_key_discreption.currentState!.save();
    } else {
      return;
    }
    for (int i = 0; i < videos.length; i++) {
      for (int j = 0; j < videos[i].length; j++) {
        if (videos_validation[i][j].currentState!.validate()) {
          videos_validation[i][j].currentState!.save();
        } else {
          return;
        }
      }
    }
    if (image == null) {
      // حط هون يطلع لليوزر ايررور يطلعلو اذا ما دخل صورة
      return;
    }

    for (int i = 0; i < videos.length; i++) {
      links.add({
        "video_url": videos[i][0].text,
        "video_title": videos[i][1].text,
        "video_time": videos[i][2].text,
      }
      );
    }

    final data = {
      "course_name": course_name.text,
      "auther_name": auther_name.text,
      "discreption": discreption.text,
      "links": links,
    };

    publish_course(data, image!);
  }

  publish_course(Object data, Uint8List image) async {
    try {
      final response = await Api.post_request_with_files_using_bytes(
        "add-course",
        data,
        "photo",
        image,
      );
      if (response.statusCode == 200) {
        log("success");
      } else {
        log("Error! ${response.statusCode}  Response: ${response.stream.bytesToString()}");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  setphoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      image = result.files.first.bytes;
      String fileName = result.files.first.name;
    }
  }
}
