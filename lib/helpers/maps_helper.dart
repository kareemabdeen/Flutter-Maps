import 'package:uuid/uuid.dart';

String generateNewSessionToken() => const Uuid().v4();
