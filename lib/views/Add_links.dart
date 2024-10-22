import 'package:admin2/components/TextFormField.dart';

import 'package:admin2/controller/Add_Course_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLinks extends StatelessWidget {
  const AddLinks({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final addcoursecontroller = Get.put(AddCourseController());
    return Column(
      children: [
        Form(
          key: addcoursecontroller.videos_validation[index][0],
          child: MyTextFormField(
            validate: (value) {
              if (value == null || value.trim().isEmpty) {
                return "can't be empty";
              }
              return null;
            },
            save: (name) {
              addcoursecontroller.videos[index][0].text = name!;
            },
            label: ' video ${index + 1} url',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: addcoursecontroller.videos_validation[index][1],
          child: MyTextFormField(
            validate: (value) {
              if (value == null || value.trim().isEmpty) {
                return "can't be empty";
              }
              return null;
            },
            save: (auther) {
              addcoursecontroller.videos[index][1].text = auther!;
            },
            label: ' vidio ${index + 1} title',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: addcoursecontroller.videos_validation[index][2],
          child: MyTextFormField(
            validate: (value) {
              if (value == null || value.trim().isEmpty) {
                return "can't be empty";
              }
              return null;
            },
            save: (disc) {
              addcoursecontroller.videos[index][2].text = disc!;
            },
            label: 'video ${index + 1} time',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
