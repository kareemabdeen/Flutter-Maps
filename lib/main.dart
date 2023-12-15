import 'package:flutter/material.dart';

import 'app_router.dart';
import 'helpers/main_important_functions.dart';

late String initialRoute;
void main() async {
  await initializeApp();
  determineInitialRoute();

  runApp(FlutterMap(appRouter: AppRouter()));
}

class FlutterMap extends StatelessWidget {
  const FlutterMap({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter
          .onGenerateRoute, // we removed the () => to make framework make use of it when it needed
      initialRoute: initialRoute,
    );
  }
}
