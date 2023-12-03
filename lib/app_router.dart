import 'package:flutter/material.dart';


import 'presentation/screens/login_screen.dart';


class AppRouter {

  static const String loginPage = '/';


  Route<dynamic>? onGenerateRoute(RouteSettings settings) {

    String routeName = settings.name ?? '/';


    switch (routeName) {

      case loginPage:


        // _ means that we arenot going to use it


        return MaterialPageRoute(

          builder: (_) {

            return const LoginScreen();

          },

        );

    }


    return null;

  }

}

