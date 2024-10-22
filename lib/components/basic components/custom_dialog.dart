import 'dart:developer';

import 'package:admin2/components/TextFormField.dart';
import 'package:admin2/controller/Add_Doctor_Controller.dart';
import 'package:admin2/controller/Home_page_controller.dart';
import 'package:admin2/controller/Theoretical_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyDialog extends StatelessWidget {
  MyDialog({super.key, required this.subjectId, this.controller, this.mem});
  final int subjectId;
  final adddoctorcontroller = Get.put(AddDoctorController());
  final homepagecontroller = Get.put(HomePageController());
final theoreticalController = Get.put(TheoreticalController());
  final controller;
  final mem;
  @override
  Widget build(BuildContext context) {
    var doctors = [];
    for (int i = 0; i < controller.decodedRes['data'].length; i++) {
      if (controller.decodedRes['data'][i]["subject_id"] == subjectId) {
        doctors = controller.decodedRes['data'][i][mem] ?? [];
        break;
      }
    }

    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: const Color(0xFFE2D3F5),
            border: Border.all(color: const Color(0xff6EC17D), width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            doctors.isEmpty
                ? const Center(
                    child: Text("No Teachers Found"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        doctors.length,
                        (j) {
                          log(doctors.toString());
                          return GetBuilder<TheoreticalController>(
                            builder: (controllerr) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                        '${(doctors[j]['full_name'])}'),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          controller.deleteDoctor(
                                              doctors[j]['email'], subjectId);
                                          doctors
                                              .remove(doctors[j]['full_name']);
                                         theoreticalController.getTheoretical();
                                         theoreticalController.update();
                                        },
                                        icon: const Icon(
                                          Iconsax.profile_remove,
                                          size: 40,
                                        ))
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
            Hero(
              tag: "login_btn",
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 150, left: 150),
                child: ElevatedButton(
                  onPressed: () {
                    
                    QuickAlert.show(
                      widget: Form(
                        key: adddoctorcontroller.key,
                        child: MyTextFormField(
                          validate: (value) {
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
                          save: (email) {
                            adddoctorcontroller.email2.text = email!;
                          },
                          label: 'email',
                        ),
                      ),
                      context: context,
                      type: QuickAlertType.info,
                      text: 'enter doctor email',
                      onConfirmBtnTap: () {
                        adddoctorcontroller.appoitmentDoctor(subjectId);
                      },
                      showConfirmBtn: true,
                    );
                  },
                  child: const Text(
                    "add doctor",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
