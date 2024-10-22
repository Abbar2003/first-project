import 'package:admin2/components/TextFormField.dart';
import 'package:admin2/constants.dart';
import 'package:admin2/controller/Add_Course_Controller.dart';
import 'package:admin2/views/Add_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddCourse extends StatelessWidget {
  const AddCourse({super.key});
  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(AddCourseController());
    return Expanded(
      child: Column(
        children: [
          const Text(
            'Add Course',
            style: TextStyle(
              color: Color(0xff6EC17D),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.17,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Form(
                            key: ctr.form_key_course_name,
                            child: MyTextFormField(
                              validate: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "can't be empty";
                                }
                                return null;
                              },
                              save: (name) {
                                ctr.course_name.text = name!;
                              },
                              label: 'course name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: ctr.form_key_auther_name,
                            child: MyTextFormField(
                              validate: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "can't be empty";
                                }
                                return null;
                              },
                              save: (auther) {
                                ctr.auther_name.text = auther!;
                              },
                              label: 'auther name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: ctr.form_key_discreption,
                            child: MyTextFormField(
                              validate: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "can't be empty";
                                }
                                return null;
                              },
                              save: (disc) {
                                ctr.discreption.text = disc!;
                              },
                              label: 'discreption',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AddCourseController>(
                        builder: (addcoursecontroller) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 2.2,
                            width: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: const Color(0xff6EC17D)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey[200],
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...List.generate(ctr.videos.length, (index) {
                                    return Column(
                                      children: [
                                        AddLinks(
                                          index: index,
                                        ),
                                        const Divider(
                                          height: 2,
                                          thickness: 2,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    );
                                  }),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          ctr.videos.add([
                                            TextEditingController(),
                                            TextEditingController(),
                                            TextEditingController()
                                          ]);

                                          ctr.videos_validation.add([
                                            GlobalKey<FormState>(),
                                            GlobalKey<FormState>(),
                                            GlobalKey<FormState>()
                                          ]);
                                          ctr.update();
                                        },
                                        icon: const Icon(
                                          Iconsax.add_square,
                                          size: 41,
                                        ),
                                      ),
                                      if (ctr.videos.length > 2)
                                        IconButton(
                                          onPressed: () {
                                            ctr.videos.remove(ctr.videos.last);
                                            ctr.update();
                                          },
                                          icon: const Icon(
                                            Iconsax.minus_square,
                                            size: 41,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.3,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: const Color(0xff6EC17D)),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    ctr.setphoto();
                  },
                  child: Image(
                    image: const AssetImage('assets/images/image.png'),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                ctr.validate_data();
              },
              child: const Text("submit"))
        ],
      ),
    );
  }
}
