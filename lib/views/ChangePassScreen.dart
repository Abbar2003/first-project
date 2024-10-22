import 'package:admin2/constants.dart';
import 'package:admin2/controller/change%20_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassScreen extends StatelessWidget {
  ChangePassScreen({super.key});
  final controller = Get.put(ChangePassController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width / 1.28,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
        ),
        Positioned(
          left: 75,
          top: 75,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.6,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFE2D3F5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Form(
                key: controller.formkey,
                child: GetBuilder<ChangePassController>(
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Reset Admin Password',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              fontFamily: ''),
                        ),
                        //************old password**************** */
                        TextFormField(
                          onSaved: (pass) {
                            controller.oldPass.text = pass!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "password missing";
                            }
                            if (value.trim().length < 8) {
                              return "password too short";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          obscureText: controller.isSecurePasswordConfirm,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: "Old password",
                            suffixIcon: controller.toggleConfirmPassWord(),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),

                        //***************new password**************** */
                        TextFormField(
                          onSaved: (pass) {
                            controller.newPass.text = pass!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "password missing";
                            }
                            if (value.trim().length < 8) {
                              return "password too short";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          obscureText: controller.isSecurePasswordConfirm,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            suffixIcon: controller.toggleConfirmPassWord(),
                            hintText: "new password",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        //***************confirm password**************** */
                        TextFormField(
                          onSaved: (pass) {
                            controller.confirm_password.text = pass!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "password missing";
                            }
                            if (value.trim().length < 8) {
                              return "password too short";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          obscureText: controller.isSecurePasswordConfirm,
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            hintText: "confirm password",
                            suffixIcon: controller.toggleConfirmPassWord(),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(defaultPadding),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        Hero(
                          tag: "login_btn",
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 40, right: 150, left: 150),
                            child: ElevatedButton(
                              onPressed: () => controller.onChangePass(),
                              child: Text(
                                "Submit".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
