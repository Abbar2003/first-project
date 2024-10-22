// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:admin2/constants.dart';
import 'package:flutter/material.dart';

class RegisterMember extends StatelessWidget {
  const RegisterMember({super.key, this.Controller, required this.name});
  final Controller;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)),
        ),
      ),
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
            Controller.full_name.text = ful!;
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
            Controller.email.text = email!;
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
    ]);
  }
}
