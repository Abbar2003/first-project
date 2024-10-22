import 'package:admin2/components/basic%20components/background.dart';
import 'package:admin2/constants.dart';
import 'package:admin2/controller/Add_Doctor_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDoctor extends StatelessWidget {
  const AddDoctor({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddDoctorController());
    return Background(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(left: 75, right: 75),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Full name missing";
                  }
                  if (value.trim().length < 3) {
                    return "Full name too short";
                  }
                  if (int.tryParse(value) != null) {
                    return 'invalid Full name';
                  }
                  return null;
                },
                onSaved: (ful) {
                  controller.full_name.text = ful!;
                },
                textInputAction: TextInputAction.done,
                cursorColor: kPrimaryColor,
                decoration: const InputDecoration(
                  hintText: "Full Name",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.abc_outlined),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75, right: 75, top: 30),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                validator: (value) {
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
                onSaved: (email) {
                  controller.email.text = email!;
                },
                decoration: const InputDecoration(
                  hintText: "email",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
          ]),
          Hero(
            tag: "login_btn",
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 150, left: 150),
              child: ElevatedButton(
                onPressed: () => controller.Add_Doctor(),
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
