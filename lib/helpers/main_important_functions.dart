import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';


import '../app_router.dart';

import '../firebase_options.dart';

import '../main.dart';


Future<void> initializeApp() async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );

}


determineInitialRoute() {

  FirebaseAuth.instance.authStateChanges().listen((user) {

    if (user == null) {

      initialRoute = AppRouter.loginPage; // this is the first time for the user

    } else {

      initialRoute = AppRouter

          .mapScreen; // this is the second time and naviagte to maps Screen

    }

  });

}
