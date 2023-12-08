import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OtpIntroText extends StatelessWidget {
  const OtpIntroText({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;
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
          text: TextSpan(
            text: 'enter your 6 Digits code numbers sent to you at ',
            style: const TextStyle(
              color: Colors.black,
              height: 1.4, //* Height between to TextSpans
            ),
            children: <TextSpan>[
              TextSpan(
                text: '+2$phoneNumber',
                style: const TextStyle(
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
