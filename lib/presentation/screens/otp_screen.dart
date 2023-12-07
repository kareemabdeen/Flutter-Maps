import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OtpScreenBody(),
      ),
    );
  }
}
