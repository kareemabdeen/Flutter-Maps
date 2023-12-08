import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OtpIntroText extends StatelessWidget {
  const OtpIntroText({
    super.key,
  });
  //final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify Your Phone Number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(20),
        RichText(
          text: const TextSpan(
            text: 'enter your 6 Digits code numbers sent to you at ',
            style: TextStyle(
              color: Colors.black,
              height: 1.4, //* Height between to TextSpans
            ),
            children: <TextSpan>[
              TextSpan(
                text: '+2001022647417',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
