import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'DataBase/dependency_injection.dart';
import 'app_router.dart';
import 'firebase_options.dart';

late String initialRoute;
void determineInitialRoute() {
  FirebaseAuth.instance.authStateChanges().listen(
    (user) {
      if (user == null) {
        initialRoute =
            AppRouter.loginPage; // this is the first time for the user
      } else {
        initialRoute = AppRouter
            .mapScreen; // this is the second time and naviagte to maps Screen
      }
    },
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  determineInitialRoute();
  setupDependencyInjection();
  runApp(
    FlutterMaps(
      appRouter: AppRouter(),
    ),
  );
}

class FlutterMaps extends StatelessWidget {
  const FlutterMaps({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter
          .onGenerateRoute, // we removed the () => to make framework make use of it when it needed
      initialRoute: initialRoute,
    );
  }
}
