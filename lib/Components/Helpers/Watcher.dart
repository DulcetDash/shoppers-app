//Responsible for taking any function and spining it up in a specified interval.

// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppers_app/Components/Helpers/SecureStorageService.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';

class Watcher with ChangeNotifier {
  // Duration? timerInterval = const Duration(seconds: 2);
  late Timer mainLoop;

  // Watcher({required this.actuatorFunctions, this.timerInterval});

  void startWatcher(
      {required List<dynamic> actuatorFunctions,
      Duration? timerInterval = const Duration(seconds: 10),
      required BuildContext context}) {
    //Start the timer
    mainLoop = Timer.periodic(timerInterval!, (Timer t) async {
      for (int i = 0; i < actuatorFunctions.length; i++) {
        String? permaToken =
            await SecureStorageService().getValue('permaToken');

        if (permaToken == null) {
          log('No valid context detected! - skipping timer');
          continue;
        }

        if (context.read<HomeProvider>().user_fingerprint == 'NONE' ||
            context.read<HomeProvider>().user_fingerprint == null ||
            context.read<HomeProvider>().user_fingerprint == '') {
          log('No valid context detected! - skipping timer');
          continue;
        }

        //? Structure
        // {name:'data fetcher name', actuator: Specific class instance child}
        //Call the tmp function
        try {
          RegExp cleanerCheck = RegExp(r"no widget", caseSensitive: false);

          if (cleanerCheck.hasMatch(context.toString()) == false) {
            switch (actuatorFunctions[i]['name']) {
              case 'GetOnlineOfflineStatus':
                actuatorFunctions[i]['actuator'].execGet(context: context);
                break;
              case 'GlobalDataFetcher':
                actuatorFunctions[i]['actuator'].getCoreDate(context: context);
                break;
              case 'LocationOpsHandler':
                actuatorFunctions[i]['actuator'].runLocationOpasHandler();
                break;
              case 'GetRequestsGraphData':
                actuatorFunctions[i]['actuator'].exec(context: context);
                break;
              case 'GetWalletDataNet':
                actuatorFunctions[i]['actuator'].exec(context: context);
                break;
              case 'GetWalletTransactionalDataNet':
                actuatorFunctions[i]['actuator'].exec(context: context);
                break;
              case 'GetDailyEarningAndAuthChecks':
                actuatorFunctions[i]['actuator'].exec(context: context);
                break;
              default:
            }
          } else //No valid context
          {
            log('No valid context detected! - try to dispose the timer');
            mainLoop.cancel();
          }
        } catch (e) {
          log('1');
          log(e.toString());
        }
      }
    });
  }
}
