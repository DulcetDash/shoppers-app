import 'dart:async';
import 'dart:developer';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:shoppers_app/Components/Helpers/Modal.dart';
import 'package:shoppers_app/Components/Helpers/PhoneNumberCaller.dart';
import 'package:shoppers_app/Components/Helpers/RequestCardHelper.dart';
import 'package:shoppers_app/Components/Modules/Navigation.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'package:provider/provider.dart';

class DeliveryList extends StatelessWidget {
  DeliveryList({Key? key}) : super(key: key);

  final Navigation _navigation = Navigation();

  @override
  Widget build(BuildContext context) {
    Map requestData = context.watch<HomeProvider>().tmpSelectedTripData;
    // log(requestData.toString());
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                // color: Colors.red,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 100,
                      child: Icon(
                        Icons.arrow_back,
                        size: AppTheme().getArrowBackSize() - 3,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'My delivery list',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'MoveTextBold', fontSize: 18),
                        ),
                      ),
                    ),
                    Container(width: 100, child: Text(''))
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: context.watch<HomeProvider>().isTheDeliveryListCompleted(
                    packagesList: requestData['origin_destination_infos']
                        ['destination_infos'])
                ? AppTheme().getPrimaryColor()
                : requestData['delivery_basic_infos']['inRouteToDropoff'] ==
                        true
                    ? AppTheme().getGenericGrey().withOpacity(0.5)
                    : AppTheme().getErrorColor(),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                context.watch<HomeProvider>().isTheDeliveryListCompleted(
                        packagesList: requestData['origin_destination_infos']
                            ['destination_infos'])
                    ? 'Kudos to you! All your deliveries are completed.'
                    : requestData['delivery_basic_infos']['inRouteToDropoff'] ==
                            true
                        ? 'Click on the individual locations to confirm delivery dropoff.'
                        : 'Please first confirm the package${requestData['origin_destination_infos']['destination_infos'].length > 1 ? 's' : ''} pickup before accessing your delivery list.',
                style: TextStyle(
                    fontSize: 14,
                    color: context
                            .watch<HomeProvider>()
                            .isTheDeliveryListCompleted(
                                packagesList:
                                    requestData['origin_destination_infos']
                                        ['destination_infos'])
                        ? Colors.white
                        : requestData['delivery_basic_infos']
                                    ['inRouteToDropoff'] ==
                                true
                            ? Colors.black
                            : Colors.white),
              ),
            ),
          ),
          Expanded(
              child: Opacity(
            opacity:
                requestData['delivery_basic_infos']['inRouteToDropoff'] == true
                    ? 1
                    : AppTheme().getFadedOpacityValue(),
            child: Container(
              child: ListView.separated(
                  padding: EdgeInsets.only(left: 0, right: 0, top: 35),
                  itemBuilder: (context, index) {
                    // log(requestData['origin_destination_infos']
                    //         ['destination_infos'][index]
                    //     .toString());
                    return PackageModel(
                        deliveryData: requestData['origin_destination_infos']
                            ['destination_infos'][index],
                        index: index,
                        navigation: _navigation,
                        isConfirmedPickup: requestData['delivery_basic_infos']
                            ['inRouteToDropoff']);
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 50,
                      ),
                  itemCount: requestData['origin_destination_infos']
                          ['destination_infos']
                      .length),
            ),
          ))
        ],
      ),
    ));
  }
}

//Delivery product model
class PackageModel extends StatefulWidget {
  final Map deliveryData;
  final int index;
  final Navigation navigation;
  final bool isConfirmedPickup;
  PackageModel(
      {Key? key,
      required this.deliveryData,
      required this.index,
      required this.navigation,
      required this.isConfirmedPickup})
      : super(key: key);

  final RequestCardHelper requestCardHelper = RequestCardHelper();

  @override
  State<PackageModel> createState() => _PackageModelState(
      deliveryData: deliveryData,
      index: index,
      navigation: navigation,
      requestCardHelper: requestCardHelper,
      isConfirmedPickup: isConfirmedPickup);
}

class _PackageModelState extends State<PackageModel> {
  final Map deliveryData;
  final int index;
  final Navigation navigation;
  final RequestCardHelper requestCardHelper;
  final bool isConfirmedPickup;
  _PackageModelState(
      {Key? key,
      required this.deliveryData,
      required this.index,
      required this.navigation,
      required this.requestCardHelper,
      required this.isConfirmedPickup});

  bool showFindPlaceloader = false;

  @override
  Widget build(BuildContext context) {
    // log(deliveryData.toString());
    deliveryData['isCompleted'] = context
            .watch<HomeProvider>()
            .tmpSelectedTripData['origin_destination_infos']
        ['destination_infos'][index]['isCompleted'];

    return Container(
      // color: Colors.red,
      child: ListTile(
        onTap: deliveryData['isCompleted'] != null
            ? () {}
            : isConfirmedPickup == false
                ? () {}
                : () {
                    //! Update the selected package index - very important
                    context
                        .read<HomeProvider>()
                        .updateSelectedPackageIndexForDelivery(index: index);
                    //!...
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
                                      scenario:
                                          'trip_dropoffConfirmation_confirmation'),
                                )),
                          );
                        });
                  },
        contentPadding: const EdgeInsets.only(left: 20, right: 20),
        horizontalTitleGap: 5,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            badges.Badge(
              badgeContent: deliveryData['isCompleted'] != null
                  ? Icon(
                      Icons.check,
                      size: 15,
                      color: deliveryData['isCompleted'] != null
                          ? Colors.white
                          : Colors.black,
                    )
                  : Icon(Icons.timelapse_sharp, size: 15),
              badgeColor: deliveryData['isCompleted'] != null
                  ? AppTheme().getPrimaryColor()
                  : AppTheme().getGenericGrey(),
              position: badges.BadgePosition.center(),
              child: null,
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${deliveryData['name']}',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: RequestCardHelper().fitLocationWidgetsToList(
                  context: context,
                  fontSize: 15,
                  locationData: [deliveryData['dropoff_location']]),
            ),
          ],
        ),
        trailing: Container(
            width: 100,
            // color: Colors.red,
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: showFindPlaceloader
                      ? () {}
                      : isConfirmedPickup == false
                          ? () {}
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

                              navigation.startNavigation(origin: {
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
                                            locationData: deliveryData[
                                                'dropoff_location'])[
                                        'location_name'],
                                'latitude': deliveryData['dropoff_location']
                                    ['coordinates'][0],
                                'longitude': deliveryData['dropoff_location']
                                    ['coordinates'][1]
                              }, context: context);
                            },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4)),
                    child: showFindPlaceloader
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.navigation,
                            color: Colors.white,
                          ),
                  ),
                ),
                InkWell(
                  onTap: isConfirmedPickup == false
                      ? () {}
                      : () => PhoneNumberCaller.callNumber(
                          phoneNumber: deliveryData['phone']),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppTheme().getSecondaryColor(),
                        borderRadius: BorderRadius.circular(4)),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
