import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/widgets/otp_intro_texts.dart';
import 'package:flutter_maps/presentation/widgets/pincode_fields.dart';
import 'package:flutter_maps/presentation/widgets/verify_button.dart';
import 'package:gap/gap.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      child: const Column(
        children: [
          OtpIntroText(),
          Gap(88),
          PinCodeFields(),
          Gap(60),
          VerifyButton(),
        ],
      ),
    );
  }
}
