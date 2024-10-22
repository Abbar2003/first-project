import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserTypeCard extends StatelessWidget {
  const UserTypeCard(
      {super.key,
      required this.title,
      required this.lotti,
      required this.onPressed});
  final String title;
  final String lotti;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Card(
          color: Colors.grey[200],
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Lottie.asset(lotti, height: 180, width: 200),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
