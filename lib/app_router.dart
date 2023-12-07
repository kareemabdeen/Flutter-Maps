import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';
import 'package:flutter_maps/presentation/screens/otp_screen.dart';

import 'Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';
import 'presentation/screens/login_screen.dart';

class AppRouter {
  static const String loginPage = '/';
  static const String otpScreen = '/otpScreen';
  static const String mapScreen = '/mapScreen';

  PhoneAuthCubit? _phoneAuthCubit;
  AppRouter() {
    _phoneAuthCubit = PhoneAuthCubit();
  }
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name ?? loginPage;

    switch (routeName) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const MapScreen();
          },
        );

      case loginPage:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<PhoneAuthCubit>.value(
              value: _phoneAuthCubit!,
              child: const LoginScreen(),
            );
          },
        );

      case otpScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<PhoneAuthCubit>.value(
              value: _phoneAuthCubit!,
              child: const OtpScreen(),
            );
          },
        );
    }

    return null;
  }
}
