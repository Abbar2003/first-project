import 'package:admin2/components/basic%20components/background.dart';
import 'package:admin2/components/login%20components/login_form.dart';
import 'package:admin2/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Column(children: [
        Row(
          children: [
            SizedBox(
              width: 110,
            ),
            Image(
              image: AssetImage('assets/images/BeIte.png'),
              height: 100,
              width: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'BeIte Website',
              style: TextStyle(color: kPrimaryColor, fontSize: 40),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LoginForm(),
            Image(image: AssetImage('assets/images/Management-Benefits.png'))
          ],
        ),
      ]),
    );
  }
}
