// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoppers_app/Components/Helpers/LocationOpsHandler.dart';
import 'package:shoppers_app/Components/Helpers/Networking.dart';
import 'package:shoppers_app/Components/Helpers/Watcher.dart';
import 'package:shoppers_app/Components/Home/CenterArea.dart';
import 'package:shoppers_app/Components/Home/DrawerMenu.dart';
import 'package:shoppers_app/Components/Home/HeaderGeneral.dart';
import 'package:shoppers_app/Components/Home/SwitcherArea.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color mainBackgroundColor = Colors.grey.withOpacity(0.15);
  int refresher = 0;
  // Create a new networking instance

  //Initialize socket events
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        refresher = 100;
      });
      // OneSignal.shared.setAppId("0737fba5-c408-4cc9-a16f-80261325e648");

      // // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
      // OneSignal.shared
      //     .promptUserForPushNotificationPermission()
      //     .then((accepted) {
      //   // print("Accepted permission: $accepted");
      // });

      // OneSignal.shared
      //     .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      //   // Will be called whenever the subscription changes
      //   // (ie. user gets registered with OneSignal and gets a user ID)
      //   // print(changes);
      // });
      // OneSignal.shared.getDeviceState().then((deviceState) {
      //   context.read<HomeProvider>().updatePushnotification_token(
      //       data: json.decode(deviceState?.jsonRepresentation() as String));
      //   // print("DeviceState: ${deviceState?.jsonRepresentation()}");
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1)).then(
        (value) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.black,
              systemNavigationBarDividerColor: Colors.black,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: Colors.black,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            )));

    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: const DrawerMenu(),
          body: Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Stack(children: [
              Container(
                // color: Colors.amber,
                child: Column(
                  children: [
                    HeaderGeneral(),
                    LoaderInstance(),
                    CenterArea(),
                    context.watch<HomeProvider>().onlineOfflineData['flag'] ==
                            'offline'
                        ? Container(
                            color: mainBackgroundColor,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: SwictherArea(),
                            ))
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              Visibility(
                visible:
                    context.watch<HomeProvider>().shouldShowBlurredBackground,
                child: SizedBox(
                    // color: Colors.red,
                    height: 50,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: const SizedBox(height: 20, width: 20),
                    )),
              )
            ]),
          )),
    );
  }
}

class LoaderInstance extends StatelessWidget {
  const LoaderInstance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.watch<HomeProvider>().shouldShowMainLoader,
      child: SizedBox(
        height: 2,
        width: MediaQuery.of(context).size.width,
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey.withOpacity(0.15),
          color: Colors.black,
        ),
      ),
    );
  }
}
