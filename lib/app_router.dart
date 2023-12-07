import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/screens/otp_screen.dart';

import 'presentation/screens/login_screen.dart';

class AppRouter {
  static const String loginPage = '/';
  static const String otpScreen = '/otpScreen';

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name ?? '/';

    switch (routeName) {
      case loginPage:
        return MaterialPageRoute(
          builder: (_) {
            return const LoginScreen();
          },
        );

      case otpScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const OtpScreen();
          },
        );
    }

    return null;
  }
}
