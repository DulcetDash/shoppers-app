import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:shoppers_app/Components/Helpers/DateParser.dart';
import 'package:shoppers_app/Components/Helpers/Networking.dart';
import 'package:shoppers_app/Components/Helpers/RequestCardHelper.dart';
import 'package:shoppers_app/Components/Home/TripDetails.dart';
import 'package:shoppers_app/Components/Home/TripDetails_Delivery.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'package:provider/provider.dart';

//The request card that showcase all the important requests infos.
class RequestCard_Delivery extends StatelessWidget {
  final Map requestData;

  const RequestCard_Delivery({Key? key, required this.requestData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return requestData['delivery_basic_infos'] == null
        ? Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                      bottom: 20),
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                      )),
                ),
                Text(
                  'Please hold...',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(208, 208, 208, 1)),
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
                                  const Padding(
                                      padding: EdgeInsets.only(left: 2)),
                                  Text(
                                    // '${requestData['delivery_basic_infos']['date_state_wishedPickup_time']} at ${DateParser(requestData['delivery_basic_infos']['wished_pickup_time']).getReadableTime()}',
                                    'DATE?',
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
                              requestData['delivery_basic_infos']
                                      ['inRouteToDropoff']
                                  ? 'Picked up'
                                  : requestData['eta_to_passenger_infos']
                                      ['eta'],
                              style: const TextStyle(
                                  fontSize: 16, fontFamily: 'MoveTextMedium'),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: requestData['request_type'] != 'scheduled',
                          child: Text(
                            'Sent ${DateParser(requestData['delivery_basic_infos']['wished_pickup_time']).getReadableTime()}',
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
                  //Delivery details
                  Container(
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        // color: Colors.red,
                        child: Image.asset(
                          'assets/Images/box_delivery.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(
                                fontFamily: 'MoveTextMedium',
                                fontSize: 15,
                                color: AppTheme().getGenericDarkGrey()),
                          ),
                          Text(
                            '${requestData['origin_destination_infos']['destination_infos'].length} destination${requestData['origin_destination_infos']['destination_infos'].length > 1 ? 's' : ''}',
                            style: TextStyle(
                                color: AppTheme().getGenericDarkGrey()),
                          )
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.asset(context
                                    .read<HomeProvider>()
                                    .getCleanPaymentMethod_nameAndImage(
                                        payment:
                                            requestData['delivery_basic_infos']
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
                                        payment:
                                            requestData['delivery_basic_infos']
                                                ['payment_method'])['name']
                                    .toString(),
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Icon(Icons.info,
                                  size: 13,
                                  color: AppTheme().getGenericDarkGrey())
                            ],
                          ),
                        ),

                        Flexible(
                          child: Text(
                            'N\$${requestData['delivery_basic_infos']['totals_delivery']['total']}',
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
            primary: tripData['delivery_basic_infos']['isAccepted'] == false
                ? AppTheme().getSecondaryColor()
                : Colors.black,
            padding: const EdgeInsets.only(left: 10, right: 10),
            textStyle: TextStyle(
                fontFamily: tripData['delivery_basic_infos']['isAccepted'] == false
                    ? 'MoveBold'
                    : 'MoveTextMedium',
                fontSize: tripData['delivery_basic_infos']['isAccepted'] == false
                    ? 22
                    : 19)),
        onPressed: context
                    .watch<HomeProvider>()
                    .targetRequestProcessor['isProcessingRequest'] &&
                context.watch<HomeProvider>().targetRequestProcessor['request_fp'] ==
                    tripData['request_fp']
            ? () => log('Already accepting the request')
            : tripData['delivery_basic_infos']['isAccepted']
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
                          return const TripDetails_Delivery();
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
                      child: Text(tripData['delivery_basic_infos']
                                  ['isAccepted'] ==
                              false
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
    // log(requestData['origin_destination_infos']['destination_infos']
    //     .toString());
    return requestData['origin_destination_infos']['destination_infos'].isEmpty
        ? SizedBox.shrink()
        : Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: requestCardHelper
                                                .fitLocationWidgetsToList(
                                                    context: context,
                                                    locationData: [
                                                  requestData['origin_destination_infos']
                                                          ['destination_infos']
                                                      [0]['dropoff_location']
                                                ]),
                                          ),
                                          Visibility(
                                            visible: requestData[
                                                            'origin_destination_infos']
                                                        ['destination_infos']
                                                    .length >
                                                1,
                                            child: Text(
                                              '+${requestData['origin_destination_infos']['destination_infos'].length - 1} more destination${requestData['origin_destination_infos']['destination_infos'].length - 1 > 1 ? 's' : ''}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: AppTheme()
                                                      .getSecondaryColor()),
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
