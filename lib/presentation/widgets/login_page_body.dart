import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/widgets/login_intro_text.dart';
import 'package:flutter_maps/presentation/widgets/next_button.dart';
import 'package:flutter_maps/presentation/widgets/phone_form_field.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class LoginPageBody extends StatelessWidget {
  LoginPageBody({super.key});

  late String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoginIntroText(),
          const Gap(150),
          PhoneFormField(),
          const Gap(70),
          const NewxtButton(),
        ],
      ),
    );
  }
}
