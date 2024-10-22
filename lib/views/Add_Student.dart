// ignore_for_file: file_names

import 'package:admin2/components/Add%20member%20Components/register_member.dart';
import 'package:admin2/components/basic%20components/background.dart';
import 'package:admin2/controller/Add_Student_controller.dart';
import 'package:admin2/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddStudentController());
    return Background(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                Get.to(const HomePage());
              },
              icon: const Icon(Icons.arrow_back)),
          const SizedBox(
            height: 100,
          ),
          RegisterMember(
            Controller: controller,
            name: 'Add Student',
          ),
          Hero(
            tag: "login_btn",
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 150, left: 150),
              child: ElevatedButton(
                onPressed: () => controller.Add_Stusent(),
                child: Text(
                  "Submit".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
