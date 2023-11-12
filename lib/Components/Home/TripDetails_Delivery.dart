// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:shoppers_app/Components/Home/DeliveryList.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppers_app/Components/Helpers/Modal.dart';
import 'package:shoppers_app/Components/Helpers/PhoneNumberCaller.dart';
import 'package:shoppers_app/Components/Helpers/RequestCardHelper.dart';
import 'package:shoppers_app/Components/Modules/Navigation.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';

class TripDetails_Delivery extends StatefulWidget {
  const TripDetails_Delivery({Key? key}) : super(key: key);

  @override
  _TripDetails_DeliveryState createState() => _TripDetails_DeliveryState();
}

class _TripDetails_DeliveryState extends State<TripDetails_Delivery> {
  RequestCardHelper requestCardHelper = RequestCardHelper();
  final Navigation _navigation = Navigation();
  bool showFindPlaceloader = false;

  @override
  Widget build(BuildContext context) {
    Map tripData = context.watch<HomeProvider>().tmpSelectedTripData;
    // log(tripData.toString());

    try {
      return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Stack(children: [
          ListView(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: Offset.fromDirection(1.5, 13))
                ]),
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.black)),
                  title: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Text('Delivery details',
                        style: TextStyle(
                            fontFamily: 'MoveTextMedium', fontSize: 17)),
                  ),
                  trailing: Text(''),
                ),
              ),
              // User details
              Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    radius: 30,
                    child: const Icon(Icons.person, color: Colors.black),
                  ),
                  title: Text(tripData['passenger_infos']['name'],
                      style: const TextStyle(
                          fontFamily: 'MoveTextBold', fontSize: 18)),
                  subtitle: Text(tripData['eta_to_passenger_infos']['eta'],
                      style: TextStyle(
                          color: AppTheme().getSecondaryColor(), fontSize: 15)),
                  trailing: InkWell(
                    onTap: () => PhoneNumberCaller.callNumber(
                        phoneNumber: tripData['passenger_infos']
                            ['phone_number']),
                    child: Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
              // General buttons
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  children: [
                    ButtonGeneralPurpose(
                        title: 'Pickup',
                        showIcon: true,
                        showLoader: showFindPlaceloader,
                        flex: 1,
                        alignment: Alignment.center,
                        textColor: Colors.white,
                        backgroundColor: Colors.black,
                        showTrailingArrow: false,
                        actuatorFunctionl: showFindPlaceloader
                            ? () {
                                log('Already loading the map');
                              }
                            : () {
                                //Start the loader for 4 seconds
                                setState(() {
                                  showFindPlaceloader = true;
                                });
                                Timer(const Duration(seconds: 3), () {
                                  setState(() {
                                    showFindPlaceloader = false;
                                  });
                                });

                                _navigation.startNavigation(origin: {
                                  'name': 'My location',
                                  'latitude': context
                                      .read<HomeProvider>()
                                      .userLocationCoords['latitude'],
                                  'longitude': context
                                      .read<HomeProvider>()
                                      .userLocationCoords['longitude']
                                }, destination: {
                                  'name':
                                      requestCardHelper.getRealisticPlacesNames(
                                              locationData: tripData[
                                                  'origin_destination_infos'])[
                                          'location_name'],
                                  'latitude':
                                      tripData['origin_destination_infos']
                                          ['coordinates']['latitude'],
                                  'longitude':
                                      tripData['origin_destination_infos']
                                          ['coordinates']['longitude']
                                }, context: context);
                              }),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    ButtonGeneralPurpose(
                      title: tripData['delivery_basic_infos']
                                  ['inRouteToDropoff'] ==
                              false
                          ? 'Confirm pickup'
                          : 'Completed',
                      showIcon: false,
                      showLoader: false,
                      showTrailingArrow: true,
                      flex: 2,
                      fontFamily: 'MoveTextMedium',
                      fontSize: 19,
                      backgroundColor: tripData['delivery_basic_infos']
                                  ['inRouteToDropoff'] ==
                              false
                          ? AppTheme().getGenericDarkGrey()
                          : AppTheme().getPrimaryColor(),
                      textColor: Colors.white,
                      alignment: Alignment.center,
                      actuatorFunctionl: tripData['delivery_basic_infos']
                                  ['inRouteToDropoff'] ==
                              false
                          ? () {
                              ConfirmPickupRequest(context: context);
                            }
                          : context
                                      .watch<HomeProvider>()
                                      .isTheDeliveryListCompleted(
                                          packagesList: tripData[
                                                  'origin_destination_infos']
                                              ['destination_infos']) ==
                                  false
                              ? () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    //...
                                    return Container(
                                      color: Colors.white,
                                      child: SafeArea(
                                          bottom: false,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.white,
                                            child: Modal(
                                                scenario:
                                                    'complete_delivery_blockedIncompleteDeliveries'),
                                          )),
                                    );
                                  })
                              : () {
                                  ConfirmDropoffRequest(context: context);
                                },
                    )
                  ],
                ),
              ),
              //Trip trajectory details
              TitleIntros(
                title: 'Itinerary',
                topPadding: 45,
              ),
              //Pickup/destination details
              OriginDestinationPrest(
                requestData: tripData,
              ),
              //Payment-passengers strip
              PaymentPassengersStrip(
                tripData: tripData,
              ),
              //Ride style details
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  child: ListTile(
                    horizontalTitleGap: 0,
                    leading: Column(
                      children: [
                        Icon(Icons.info),
                      ],
                    ),
                    title: Text('Note'),
                    subtitle: Text(
                        'Please confirm the dropoff of all the individual packages as you drop them off.'),
                  ),
                ),
              ),
              Divider(),
              // Cancel trips?
              Visibility(
                visible: tripData['delivery_basic_infos']['inRouteToDropoff'] ==
                    false,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => CancelRequest(context: context),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                            horizontalTitleGap: 0,
                            leading: const Icon(Icons.not_interested,
                                color: Color.fromRGBO(178, 34, 34, 1)),
                            title: Text('Cancel the delivery',
                                style: const TextStyle(
                                    fontFamily: 'MoveTextRegular',
                                    fontSize: 18,
                                    color: Color.fromRGBO(178, 34, 34, 1))),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: Color.fromRGBO(178, 34, 34, 1),
                                size: 12)),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              //Safety section
              const TitleIntros(
                title: 'Safety',
                topPadding: 35,
              ),
              InkWell(
                onTap: () => PhoneNumberCaller.callNumber(phoneNumber: '10111'),
                child: const ListTile(
                  horizontalTitleGap: 0,
                  leading: Icon(Icons.security,
                      color: Color.fromRGBO(178, 34, 34, 1)),
                  title: Text('Emergency call',
                      style: TextStyle(
                          fontFamily: 'MoveTextMedium', fontSize: 18)),
                  subtitle: Text('Reach quickly the police.'),
                ),
              )
            ],
          ),
          Visibility(
            visible: context.watch<HomeProvider>().shouldShowBlurredBackground,
            child: SizedBox(
                // color: Colors.red,
                height: 50,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const SizedBox(height: 20, width: 20),
                )),
          )
        ])),
      );
    } catch (e) {
      Navigator.of(context).pop(); //Autoclose the modal
      return Container(
        child: Text(''),
      );
    }
  }

  //Cancel request
  void CancelRequest({required BuildContext context}) {
    context.read<HomeProvider>().updateBlurredBackgroundState(
        shouldShow: true); //Show blurred background
    showModalBottomSheet(
            context: context,
            builder: (context) {
              //...
              return Container(
                color: Colors.white,
                child: SafeArea(
                    bottom: false,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Modal(scenario: 'trip_cancellation_confirmation'),
                    )),
              );
            })
        .whenComplete(() => context
            .read<HomeProvider>()
            .updateBlurredBackgroundState(shouldShow: false));
  }

  //Confirm pickup request
  void ConfirmPickupRequest({required BuildContext context}) {
    context.read<HomeProvider>().updateBlurredBackgroundState(
        shouldShow: true); //Show blurred background
    showModalBottomSheet(
            context: context,
            builder: (context) {
              //...
              return Container(
                color: Colors.white,
                child: SafeArea(
                    bottom: false,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Modal(
                          scenario: 'trip_pickupConfirmation_confirmation'),
                    )),
              );
            })
        .whenComplete(() => context
            .read<HomeProvider>()
            .updateBlurredBackgroundState(shouldShow: false));
  }

  //Confirm dropoff request
  void ConfirmDropoffRequest({required BuildContext context}) {
    context.read<HomeProvider>().updateBlurredBackgroundState(
        shouldShow: true); //Show blurred background
    showModalBottomSheet(
            context: context,
            builder: (context) {
              //...
              return Container(
                color: Colors.white,
                child: SafeArea(
                    bottom: false,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Modal(
                        scenario: 'trip_dropoffConfirmation_confirmation',
                        scope: 'final',
                      ),
                    )),
              );
            })
        .whenComplete(() => context
            .read<HomeProvider>()
            .updateBlurredBackgroundState(shouldShow: false));
  }
}

// Title intros
class TitleIntros extends StatelessWidget {
  final String title;
  final double topPadding;

  const TitleIntros({Key? key, required this.title, required this.topPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: EdgeInsets.only(left: 15, top: topPadding, bottom: 15),
        child: Text(title,
            style: const TextStyle(
                fontFamily: 'MoveTextMedium',
                fontSize: 16,
                color: Color.fromRGBO(124, 110, 110, 1))),
      ),
    );
  }
}

// Button general purpose
class ButtonGeneralPurpose extends StatelessWidget {
  final String title;
  final bool showIcon;
  final int flex;
  final bool showTrailingArrow;
  bool showLoader = false;
  double? fontSize = 15;
  String? fontFamily = 'MoveTextRegular';
  Color? textColor = Colors.white;
  Color? backgroundColor = AppTheme().getSecondaryColor();
  Alignment? alignment = Alignment.center;
  final actuatorFunctionl; //! The function that will be fired when the button is clicked.

  ButtonGeneralPurpose({
    Key? key,
    required this.actuatorFunctionl,
    required this.title,
    required this.showIcon,
    required this.flex,
    required this.showTrailingArrow,
    required this.showLoader,
    this.fontSize,
    this.fontFamily,
    this.textColor,
    this.backgroundColor,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: backgroundColor,
          ),
          onPressed: actuatorFunctionl,
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 5, right: 5),
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            minLeadingWidth: 0,
            leading: showIcon
                ? Visibility(
                    visible: showLoader == false,
                    child: Container(
                        // color: Colors.amber,
                        height: 30,
                        child: Icon(Icons.navigation_sharp,
                            size: 18, color: textColor)),
                  )
                : null,
            title: showLoader
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                          height: 20.0,
                          width: 20.0,
                        )
                      ],
                    ),
                  )
                : Container(
                    height: 30,
                    alignment: alignment,
                    // color: Colors.red,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: fontSize,
                          fontFamily: fontFamily,
                          color: textColor),
                    )),
            trailing: showTrailingArrow
                ? Icon(
                    Icons.arrow_forward,
                    color: textColor,
                  )
                : null,
          )),
    );
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
    return InkWell(
      onTap: () {
        showMaterialModalBottomSheet(
            expand: true,
            isDismissible: true,
            enableDrag: false,
            context: context,
            duration: Duration(milliseconds: 250),
            builder: (context) {
              // sound.playSound();
              //...
              return Container(
                color: Colors.white,
                child: SafeArea(
                    bottom: false,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: DeliveryList(),
                    )),
              );
            });
      },
      child: Container(
        // color: Colors.amber,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
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
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        padding: EdgeInsets.all(0.5),
                        borderType: BorderType.RRect,
                        dashPattern: [4, 1],
                        child: Container(
                          // width: 1,
                          height: 48,
                        ),
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
                                    children: [
                                      Column(
                                        children: requestCardHelper
                                            .fitLocationWidgetsToList(
                                                context: context,
                                                locationData: [
                                              requestData['origin_destination_infos']
                                                      ['destination_infos'][0]
                                                  ['dropoff_location']
                                            ]),
                                      ),
                                      Visibility(
                                        visible:
                                            requestData['origin_destination_infos']
                                                        ['destination_infos']
                                                    .length >
                                                1,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              '+${requestData['origin_destination_infos']['destination_infos'].length - 1} more destination${requestData['origin_destination_infos']['destination_infos'].length - 1 > 1 ? 's' : ''}',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppTheme()
                                                      .getSecondaryColor()),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                context
                                        .watch<HomeProvider>()
                                        .isTheDeliveryListCompleted(
                                            packagesList: requestData[
                                                    'origin_destination_infos']
                                                ['destination_infos'])
                                    ? Icon(Icons.check_circle,
                                        size: 15,
                                        color: AppTheme().getSecondaryColor())
                                    : Icon(Icons.timelapse_sharp,
                                        size: 15,
                                        color: AppTheme().getSecondaryColor()),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  context
                                          .watch<HomeProvider>()
                                          .isTheDeliveryListCompleted(
                                              packagesList: requestData[
                                                      'origin_destination_infos']
                                                  ['destination_infos'])
                                      ? "Delivery list completed"
                                      : 'Click to see your delivery list',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'MoveTextMedium',
                                      color: AppTheme().getSecondaryColor()),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 13, color: AppTheme().getSecondaryColor())
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Payment-passenger strip
class PaymentPassengersStrip extends StatelessWidget {
  final Map tripData;
  const PaymentPassengersStrip({Key? key, required this.tripData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.red),
            color: Colors.grey.withOpacity(0.1)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Payment method
              Flexible(
                child: Row(
                  children: [
                    const Icon(Icons.credit_card, size: 20),
                    Text(
                        context
                            .read<HomeProvider>()
                            .getCleanPaymentMethod_nameAndImage(
                                payment: tripData['delivery_basic_infos']
                                    ['payment_method'])['name']
                            .toString(),
                        style: const TextStyle(fontSize: 17)),
                  ],
                ),
              ),
              //Amount payment
              Text(
                  'N\$ ${tripData['delivery_basic_infos']['totals_delivery']['total']}',
                  style: TextStyle(
                      fontFamily: 'MoveBold',
                      fontSize: 25,
                      color: AppTheme().getPrimaryColor())),
            ],
          ),
        ),
      ),
    );
  }
}
