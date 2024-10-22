// ignore_for_file: must_be_immutable

import 'package:admin2/constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });
  final Icon icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      iconColor: const Color(0xff6EC17D),
      title: Text(
        title,
        style: const TextStyle(color: kPrimaryColor),
      ),
      onTap: onPressed,
    );
  }
}
