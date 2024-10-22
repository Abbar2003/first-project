// ignore_for_file: must_be_immutable

import 'package:admin2/components/Add%20member%20Components/register_member.dart';
import 'package:admin2/components/Home%20Page%20compnents/listTile.dart';
import 'package:admin2/constants.dart';
import 'package:admin2/controller/Add_Doctor_Controller.dart';
import 'package:admin2/controller/Add_Student_controller.dart';
import 'package:admin2/controller/Add_Teacher_Controller.dart';
import 'package:admin2/controller/Home_page_controller.dart';
import 'package:admin2/controller/Theoretical_controller.dart';
import 'package:admin2/controller/logout_controller.dart';
import 'package:admin2/controller/practical_controller.dart';
import 'package:admin2/views/Add_Course.dart';
import 'package:admin2/views/ChangePassScreen.dart';
import 'package:admin2/views/show_practicall_subject.dart';
import 'package:admin2/views/show_theoretical_subject.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:awesome_dialog/awesome_dialog.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    final adddoctorcontroller = Get.put(AddDoctorController());
    final addstudentcontroller = Get.put(AddStudentController());
    final theoreticalController = Get.put(TheoreticalController());
    final practicalController = Get.put(PracticalController());
    final logoutcontroller = Get.put(LogoutController());
    final addteachercontroller = Get.put(AddTeacherController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Row(children: [
        //drawer**
        Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  Image(
                    image: AssetImage('assets/images/BeIte.png'),
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      Text(
                        'BeITE ',
                        style: TextStyle(fontSize: 30, color: kPrimaryColor),
                      ),
                      Text(
                        ' Website',
                        style: TextStyle(fontSize: 30, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              CustomListTile(
                icon: const Icon(Icons.home),
                title: 'Home Page',
                onPressed: () {
                  controller.count = 0;
                  controller.update();
                },
              ),
              CustomListTile(
                icon: const Icon(Icons.person_add_alt),
                title: 'Add Doctor',
                onPressed: () {
                  controller.count = 1;
                  controller.update();
                },
              ),
              CustomListTile(
                icon: const Icon(Icons.person_add_alt),
                title: 'Add Student',
                onPressed: () {
                  controller.count = 2;
                  controller.update();
                },
              ),
              CustomListTile(
                icon: const Icon(Icons.person_add_alt),
                title: 'Add Teacher',
                onPressed: () {
                  controller.count = 15;
                  controller.update();
                },
              ),
              CustomListTile(
                icon: const Icon(Icons.add_box_outlined),
                title: 'Add course',
                onPressed: () {
                  controller.count = 3;
                  controller.update();
                },
              ),
              CustomListTile(
                icon: const Icon(Icons.password),
                title: 'Reset Password',
                onPressed: () {
                  controller.count = 4;
                  controller.update();
                },
              ),
              CustomListTile(
                icon: const Icon(Icons.logout),
                title: 'Log Out',
               onPressed: (){
                  AwesomeDialog(width: MediaQuery.of(context).size.width/2.5,
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Are you sure',
            titleTextStyle: TextStyle(color: Colors.blue,fontSize: 30),
            desc: 'to log out',
            descTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            btnCancelOnPress: () {Get.back();},
            btnOkOnPress: () {
               logoutcontroller.logout();
                  
            },
            ).show();
           
                 },
              ),
            ],
          ),
        ),
        GetBuilder<HomePageController>(
            builder: (controller) =>
                //**************Home page:********************
                controller.count == 0
                    ? Stack(
                        children: [
                          //external container
                          Container(
                            height: double.infinity,
                            width: MediaQuery.of(context).size.width / 1.28,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                          ),
                          //internal container
                          Positioned(
                            left: 10,
                            top: 20,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 1.32,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFE2D3F5),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: const Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/Management-Benefits.png'),
                                    height: 140,
                                    width: 150,
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        'Welcom To BeITE Dashboard',
                                        style: TextStyle(
                                            color: kPrimaryColor, fontSize: 35),
                                      ),
                                      subtitle: Text(
                                        'Where you can manege BeITE App,you can add doctor,student,course and you can you can do many things.',
                                        style: TextStyle(
                                            fontFamily: 'PlaywriteCU',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/BeIte.png'),
                                    height: 140,
                                    width: 150,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 300,
                            left: 30,
                            child: InkWell(
                              onTap: () {
                                theoreticalController.getTheoretical();
                                controller.count = 7;
                                controller.update();
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/design.png'),
                                      height: 100,
                                      width: 120,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Theoretical Subjects',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 300,
                            left: 400,
                            child: InkWell(
                              onTap: () {
                                practicalController.getPractical();
                                controller.count = 8;
                                controller.update();
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/practical.png'),
                                      height: 100,
                                      width: 120,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Practical Subjects',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )

                    //************Add Doctor***************** */
                    : controller.count == 1
                        ? Form(
                            key: adddoctorcontroller.form_key,
                            child: Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.3,
                                    width:
                                        MediaQuery.of(context).size.width / 1.7,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 100,
                                        ),
                                        RegisterMember(
                                          name: 'Add Doctor',
                                          Controller: adddoctorcontroller,
                                        ),
                                        Hero(
                                          tag: "login_btn",
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 40, right: 150, left: 150),
                                            child: ElevatedButton(
                                              onPressed: () =>
                                                  adddoctorcontroller
                                                      .Add_Doctor(),
                                              child: Text(
                                                "Submit".toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Image(
                                    image:
                                        AssetImage('assets/images/teacher.png'),
                                    height: 250,
                                    width: 175,
                                  )
                                ],
                              ),
                            ),
                          )
                        //*************Add Student***********////// */
                        : controller.count == 2
                            ? Form(
                                key: addstudentcontroller.form_key,
                                child: Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.7,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 100,
                                            ),
                                            RegisterMember(
                                              Controller: addstudentcontroller,
                                              name: 'Add Student',
                                            ),
                                            Hero(
                                              tag: "login_btn",
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 40,
                                                    right: 150,
                                                    left: 150),
                                                child: ElevatedButton(
                                                  onPressed: () =>
                                                      addstudentcontroller
                                                          .Add_Stusent(),
                                                  child: Text(
                                                    "Submit".toUpperCase(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/programmer.png'),
                                        height: 250,
                                        width: 175,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            /***********Add Teacher */
                            : controller.count == 15
                                ? Form(
                                    key: addteachercontroller.form_key,
                                    child: Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.7,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 100,
                                                ),
                                                RegisterMember(
                                                  name: 'Add Teacher',
                                                  Controller:
                                                      addteachercontroller,
                                                ),
                                                Hero(
                                                  tag: "login_btn",
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 40,
                                                            right: 150,
                                                            left: 150),
                                                    child: ElevatedButton(
                                                      onPressed: () =>
                                                          addteachercontroller
                                                              .Add_Teacher(),
                                                      child: Text(
                                                        "Submit".toUpperCase(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Image(
                                            image: AssetImage(
                                                'assets/images/teacher.png'),
                                            height: 250,
                                            width: 175,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : controller.count == 4
                                    ? Expanded(child: ChangePassScreen())
                                    /**************Theoretical****************** */
                                    : controller.count == 7
                                        ? ShowTheoreticalSubject()
                                        /**************Practical********** */
                                        : controller.count == 8
                                            ? ShowPracticalSubject()
                                            /**********Add Course********** */
                                            : controller.count == 3
                                                ? const AddCourse()
                                               
                                                    : const Text('data'))
      ]),
    );
  }
}
