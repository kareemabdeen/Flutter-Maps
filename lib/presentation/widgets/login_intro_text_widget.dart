import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginIntroText extends StatelessWidget {
  const LoginIntroText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is You Phone Number?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(20),
        Text(
          'please enter your phone number to verify your account.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
