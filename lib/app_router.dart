import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Buisness_Logic/cubits/Maps_cubit/maps_cubit.dart';
import 'package:flutter_maps/DataBase/dependency_injection.dart';

import 'Buisness_Logic/cubits/Phone_Auth/phone_auth_cubit.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/map_screen.dart';
import 'presentation/screens/otp_screen.dart';

class AppRouter {
  static const String loginPage = '/Login-screen';
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
            return BlocProvider<MapsCubit>(
              create: (context) => getIt<MapsCubit>(),
              child: const MapScreen(),
            );
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
        final String phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<PhoneAuthCubit>.value(
              value: _phoneAuthCubit!,
              child: OtpScreen(phoneNumber: phoneNumber),
            );
          },
        );
    }

    return null;
  }
}
