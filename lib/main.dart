// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'package:shoppers_app/Components/Providers/RegistrationProvider.dart';
import 'package:shoppers_app/ThemesAndRoutes/AppRoutes.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  debugPrint = (String? message, {int? wrapWidth}) => null;

  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => RegistrationProvider())
    ],
    child: const AppGeneralEntry(),
  ));
}
