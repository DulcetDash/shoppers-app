// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppers_app/Components/Home/Home.dart';
import 'package:shoppers_app/Components/Login/EntryScreen.dart';
import 'package:shoppers_app/Components/Login/OTPVerificationEntry.dart';
import 'package:shoppers_app/Components/Login/PhoneDetailsScreen.dart';
import 'package:shoppers_app/Components/Login/RegisterOptions.dart';
import 'package:shoppers_app/Components/Login/RegisterOptionsDriver.dart';
import 'package:shoppers_app/Components/Login/RegistrationDelivery.dart';
import 'package:shoppers_app/Components/Login/RegistrationRide.dart';
import 'package:shoppers_app/Components/Login/RegistrationRideIndividual.dart';
import 'package:shoppers_app/Components/Login/SelectCar.dart';
import 'package:shoppers_app/Components/Login/SelectCarColor.dart';
import 'package:shoppers_app/Components/Login/SelectCarDirectory.dart';
import 'package:shoppers_app/Components/Login/SelectCarModels.dart';
import 'package:shoppers_app/Components/Login/SelectCarRide.dart';
import 'package:shoppers_app/Components/Login/SelectCarRideIndividual.dart';
import 'package:shoppers_app/Components/Login/SignupEntry.dart';
import 'package:shoppers_app/Components/Login/SplashScreen.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'package:shoppers_app/Components/Providers/RegistrationProvider.dart';
import 'package:shoppers_app/Components/Settings/Settings.dart';
import 'package:shoppers_app/Components/Support/Support.dart';
import 'package:shoppers_app/Components/Wallet/Payouts.dart';
import 'package:shoppers_app/Components/Wallet/Summary.dart';
import 'package:shoppers_app/Components/Wallet/Wallet.dart';
import 'package:shoppers_app/Components/YourRides/DetailedTripShow.dart';
import 'package:shoppers_app/Components/YourRides/YourRides.dart';
import 'package:shoppers_app/ThemesAndRoutes/AppTheme.dart' as AppTheme;

class AppGeneralEntry extends StatefulWidget {
  const AppGeneralEntry({Key? key}) : super(key: key);

  @override
  _AppGeneralEntryState createState() => _AppGeneralEntryState();
}

class _AppGeneralEntryState extends State<AppGeneralEntry> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Restore the registration flow
    context.read<RegistrationProvider>().restoreStateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: AppTheme.appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/Entry': (context) => const EntryScreen(),
          '/PhoneDetailsScreen': (context) => const PhoneDetailsScreen(),
          '/OTPVerificationEntry': (context) => const OTPVerificationEntry(),
          '/SignupEntry': (context) => const SignupEntry(),
          '/RegisterOptions': (context) => const RegisterOptions(),
          '/RegisterOptionsDriver': (context) => const RegisterOptionsDriver(),
          '/RegistrationDelivery': (context) => const RegistrationDelivery(),
          '/RegistrationRide': (context) => const RegistrationRide(),
          '/RegistrationRideIndividual': (context) =>
              const RegistrationRideIndividual(),
          '/SelectCar': (context) => const SelectCar(),
          '/SelectCarRide': (context) => const SelectCarRide(),
          '/SelectCarRideIndividual': (context) =>
              const SelectCarRideIndividual(),
          '/SelectCarDirectory': (context) => const SelectCarDirectory(),
          '/SelectCarModels': (context) => const SelectCarModels(),
          '/SelectCarColor': (context) => const SelectCarColor(),
          '/Home': (context) => Home(),
          '/YourRides': (context) => const YourRides(),
          '/DetailedTripShow': (context) => const DetailedTripShow(),
          '/Wallet': (context) => const Wallet(),
          '/WalletSummary': (context) => const Summary(),
          '/WalletPayout': (context) => const Payouts(),
          '/Settings': (context) => const Settings(),
          '/Support': (context) => const Support(),
        });
  }
}
