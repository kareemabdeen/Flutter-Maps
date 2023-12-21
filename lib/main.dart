import 'package:flutter/material.dart';
import 'package:flutter_maps/DataBase/dependency_injection.dart';

import 'app_router.dart';
import 'helpers/main_important_functions.dart';

late String initialRoute;
void main() async {
  await initializeApp();
  determineInitialRoute();
  setupDependencyInjection();
  runApp(FlutterMaps(appRouter: AppRouter()));
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
