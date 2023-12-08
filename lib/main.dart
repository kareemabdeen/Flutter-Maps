import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/firebase_options.dart';

import 'app_router.dart';

late String intialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      //initialRoute: intialRoute,
    );
  }
}
