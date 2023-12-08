import 'package:flutter/material.dart';

import '../widgets/login_page_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: LoginPageBody(),
      ),
    );
  }
}
