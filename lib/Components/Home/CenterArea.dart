// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:shoppers_app/Components/Helpers/DateParser.dart';
import 'package:shoppers_app/Components/Helpers/LocationOpsHandler.dart';
import 'package:shoppers_app/Components/Helpers/Modal.dart';
import 'package:shoppers_app/Components/Helpers/Networking.dart';
import 'package:shoppers_app/Components/Helpers/RequestCardHelper.dart';
import 'package:shoppers_app/Components/Helpers/Sound.dart';
import 'package:shoppers_app/Components/Home/RequestCard_Delivery.dart';
import 'package:shoppers_app/Components/Home/RequestCard_Shopping.dart';
import 'package:shoppers_app/Components/Home/TripDetails.dart';
import 'package:shoppers_app/Components/Modules/GenericRectButton/GenericRectButton.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'package:provider/provider.dart';

class CenterArea extends StatefulWidget {
  const CenterArea({Key? key}) : super(key: key);

  @override
  _CenterAreaState createState() => _CenterAreaState();
}

class _CenterAreaState extends State<CenterArea> {
  final Color mainBackgroundColor = Colors.grey.withOpacity(0.15);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: mainBackgroundColor,
      child: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: context.watch<HomeProvider>().locationServicesStatus['isLocationServiceEnabled'] &&
                  context
                      .watch<HomeProvider>()
                      .locationServicesStatus['isLocationPermissionGranted'] &&
                  context.watch<HomeProvider>().locationServicesStatus['isLocationDeniedForever'] ==
                      false
              ? context.watch<HomeProvider>().tripRequestsData.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.only(top: 20, bottom: 70),
                      itemBuilder: (context, index) =>
                          context.watch<HomeProvider>().selectedOption == 'ride'
                              ? RequestCard(
                                  requestData: context
                                      .read<HomeProvider>()
                                      .tripRequestsData[index])
                              : context.read<HomeProvider>().tripRequestsData[index]
                                          ['request_type'] ==
                                      'DELIVERY'
                                  ? RequestCard_Delivery(
                                      requestData: context
                                          .watch<HomeProvider>()
                                          .tripRequestsData[index])
                                  : RequestCard_Shopping(
                                      requestData: context
                                          .watch<HomeProvider>()
                                          .tripRequestsData[index]),
                      separatorBuilder: (context, index) =>
                          const Padding(padding: EdgeInsets.only(top: 15)),
                      itemCount: context.read<HomeProvider>().tripRequestsData.length)
                  : context.watch<HomeProvider>().onlineOfflineData['flag'] == 'offline'
                      ? const OfflineWindow()
                      : const EmptyTripsWindow()
              : const RequestLocationWindow()),
    ));
  }
}

//Show offline
class OfflineWindow extends StatelessWidget {
  const OfflineWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child:
                      Icon(Icons.bolt, size: 50, color: Colors.grey.shade600),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("You're offline",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'MoveTextMedium',
                          color: Colors.grey.shade600,
                          fontSize: 20)),
                ),
                Text("Go online to receive requests.",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 16)),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

//Show empty trips window
class EmptyTripsWindow extends StatelessWidget {
  const EmptyTripsWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 15,
                      top: MediaQuery.of(context).size.height * 0.25),
                  child: Icon(Icons.sync_outlined,
                      size: 50, color: Colors.grey.shade600),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(getSuitableEmptyScreen(context: context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'MoveTextMedium',
                          color: Colors.grey.shade600,
                          fontSize: 18)),
                ),
                Text('We\'ll notify you when new requests come.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 16)),
              ],
            ),
          ))
        ],
      ),
    );
  }

  //Get suitable sentences for empty screens
  String getSuitableEmptyScreen({required BuildContext context}) {
    String selectedOption = context
                .watch<HomeProvider>()
                .onlineOfflineData['operation_clearance'] !=
            null
        ? context
            .watch<HomeProvider>()
            .onlineOfflineData['operation_clearance']
            .toString()
            .toLowerCase()
        : 'NONE'; //ride, delivery, scheduled or accepted

    if (selectedOption == 'ride') {
      return 'No rides so far';
    } else if (selectedOption == 'delivery') {
      return 'No deliveries so far';
    } else if (selectedOption == 'shopping') {
      return 'No shopping so far';
    } else {
      return 'No request so far';
    }
  }
}

//Show request for location window
class RequestLocationWindow extends StatelessWidget {
  const RequestLocationWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Icon(Icons.sync_outlined,
                    size: 50, color: Colors.grey.shade600),
              ),
              Text(
                  'You will start seeing new requests after activating your location.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
            ],
          ),
        )),
        InkWell(
          onTap: () {
            //Update the auto ask state - free it
            context.read<HomeProvider>().updateAutoAskGprsCoords(didAsk: false);
            //...
            LocationOpsHandler locationOpsHandler =
                LocationOpsHandler(context: context);
            locationOpsHandler.requestLocationPermission(isUserTriggered: true);
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              height: 200,
              decoration: BoxDecoration(color: AppTheme().getSecondaryColor()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                      title: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(Icons.location_disabled_sharp,
                                color: Colors.white),
                          ),
                          Text('Your location is off.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'MoveBold',
                                  fontSize: 23)),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 31, top: 10),
                        child: Column(
                          children: [
                            Text(
                                context
                                            .watch<HomeProvider>()
                                            .locationServicesStatus[
                                        'isLocationDeniedForever']
                                    ? 'Your locations services need to be on for an optimal experience. You need the activate it from your settings.'
                                    : 'Your locations services need to be on for an optimal experience.',
                                style: const TextStyle(color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Click here to activate it.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'MoveTextMedium',
                                          fontSize: 16)),
                                  Icon(Icons.arrow_forward, color: Colors.white)
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              )),
        )
      ],
    );
  }
}

//The request card that showcase all the important requests infos.
class RequestCard extends StatelessWidget {
  final Map requestData;

  const RequestCard({Key? key, required this.requestData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(208, 208, 208, 1)),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7)
            ],
            color: Colors.white),
        child: Column(
          children: [
            Visibility(
                visible: requestData['request_type'] == 'scheduled',
                child: Container(
                  color: const Color.fromRGBO(178, 34, 34, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 8, right: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.white, size: 15),
                            const Padding(padding: EdgeInsets.only(left: 2)),
                            Text(
                              '${requestData['ride_basic_infos']['date_state_wishedPickup_time']} at ${DateParser(requestData['ride_basic_infos']['wished_pickup_time']).getReadableTime()}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'MoveTextRegular',
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.timer, size: 15),
                      const Padding(padding: EdgeInsets.only(left: 2)),
                      Text(
                        requestData['ride_basic_infos']['inRideToDestination']
                            ? 'Picked up'
                            : requestData['eta_to_passenger_infos']['eta'],
                        style: const TextStyle(
                            fontSize: 16, fontFamily: 'MoveTextMedium'),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: requestData['request_type'] != 'scheduled',
                    child: Text(
                      'Sent ${DateParser(requestData['ride_basic_infos']['wished_pickup_time']).getReadableTime()}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Payment method
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: Image.asset(context
                              .read<HomeProvider>()
                              .getCleanPaymentMethod_nameAndImage(
                                  payment: requestData['ride_basic_infos']
                                      ['payment_method'])['image']
                              .toString()),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          context
                              .read<HomeProvider>()
                              .getCleanPaymentMethod_nameAndImage(
                                  payment: requestData['ride_basic_infos']
                                      ['payment_method'])['name']
                              .toString(),
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),

                  Flexible(
                    child: Text(
                      'N\$${requestData['ride_basic_infos']['fare_amount']}',
                      style: TextStyle(
                          fontFamily: 'MoveBold',
                          fontSize: 22,
                          color: AppTheme().getPrimaryColor()),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 0,
              color: Colors.white,
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // alignment: Alignment.centerLeft,
                  // color: Colors.red,
                  // width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.person, size: 20),
                      Text(
                          requestData['ride_basic_infos']['passengers_number']
                              .toString(),
                          style: const TextStyle(
                              fontSize: 20, fontFamily: 'MoveTextMedium'))
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                    // alignment: Alignment.centerRight,
                    // color: Colors.red,
                    child: Text(
                        requestData['request_type'] == 'DELIVERY'
                            ? 'Delivery'
                            : RequestCardHelper().ucFirst(
                                requestData['ride_basic_infos']['ride_style']),
                        style: const TextStyle(
                            fontFamily: 'MoveTextMedium', fontSize: 16))),
              ],
            ),
            const Divider(
              thickness: 1,
              height: 25,
            ),
            OriginDestinationPrest(
              requestData: requestData,
            ),
            const Divider(
              thickness: 1,
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(''),
                  AcceptOrDetailsBtn(
                    tripData: requestData,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Accept or trip details buttons
class AcceptOrDetailsBtn extends StatelessWidget {
  final Map tripData;

  const AcceptOrDetailsBtn({Key? key, required this.tripData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(190, 60),
            primary: tripData['ride_basic_infos']['isAccepted'] == false
                ? AppTheme().getPrimaryColor()
                : Colors.black,
            padding: const EdgeInsets.only(left: 10, right: 10),
            textStyle: TextStyle(
                fontFamily: tripData['ride_basic_infos']['isAccepted'] == false
                    ? 'MoveBold'
                    : 'MoveTextMedium',
                fontSize: tripData['ride_basic_infos']['isAccepted'] == false
                    ? 22
                    : 19)),
        onPressed: context
                    .watch<HomeProvider>()
                    .targetRequestProcessor['isProcessingRequest'] &&
                context
                        .watch<HomeProvider>()
                        .targetRequestProcessor['request_fp'] ==
                    tripData['request_fp']
            ? () => log('Already accepting the request')
            : tripData['ride_basic_infos']['isAccepted']
                ? () {
                    //Update the selected ride
                    context
                        .read<HomeProvider>()
                        .updateTmpSelectedTripsData(data: tripData);
                    //...
                    showMaterialModalBottomSheet(
                        duration: const Duration(milliseconds: 350),
                        context: context,
                        builder: (context) {
                          return const TripDetails();
                        });
                  }
                : () {
                    // ? Update the temporary ride data
                    context.read<HomeProvider>().updateTargetedRequestPro(
                        isBeingProcessed: true,
                        request_fp: tripData['request_fp']);
                    //? Request for the accepting ride
                    AcceptRequestNet acceptRequestNet = AcceptRequestNet();
                    acceptRequestNet.exec(
                        context: context, request_fp: tripData['request_fp']);
                  },
        child: context
                    .watch<HomeProvider>()
                    .targetRequestProcessor['isProcessingRequest'] &&
                context
                        .watch<HomeProvider>()
                        .targetRequestProcessor['request_fp'] ==
                    tripData['request_fp']
            ? const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))
            : Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                          tripData['ride_basic_infos']['isAccepted'] == false
                              ? 'Accept'
                              : 'Details'),
                    ),
                  ),
                  Icon(Icons.arrow_forward)
                ],
              ));
  }
}

//Origin / destination drawing presentation
class OriginDestinationPrest extends StatelessWidget {
  final Map requestData;
  final RequestCardHelper requestCardHelper = RequestCardHelper();

  OriginDestinationPrest({Key? key, required this.requestData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.circle,
                      size: 8,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 1,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 23),
                    child: Icon(
                      Icons.stop,
                      size: 15,
                      color: AppTheme().getSecondaryColor(),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.orange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // color: AppTheme().getPrimaryColor(),
                                height: 33,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: SizedBox(
                                      width: 45,
                                      child: Text(
                                        'From',
                                        style: TextStyle(
                                            fontFamily: 'MoveTextLight'),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  // color: Colors.amber,
                                  child: Column(
                                    children: requestCardHelper
                                        .fitLocationWidgetsToList(
                                            context: context,
                                            locationData: [
                                          requestData[
                                                  'origin_destination_infos']
                                              ['pickup_infos']
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Destination
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: AppTheme().getPrimaryColor(),
                              height: 34,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: SizedBox(
                                    width: 45,
                                    child: Text(
                                      'To',
                                      style: TextStyle(
                                          fontFamily: 'MoveTextLight'),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                // color: Colors.amber,
                                child: Column(
                                  children: requestCardHelper
                                      .fitLocationWidgetsToList(
                                          context: context,
                                          locationData: requestData[
                                                  'origin_destination_infos']
                                              ['destination_infos']),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
