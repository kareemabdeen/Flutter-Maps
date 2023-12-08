import 'package:flutter/material.dart';

import '../widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OtpScreenBody(phoneNumber: phoneNumber),
      ),
    );
  }
}
