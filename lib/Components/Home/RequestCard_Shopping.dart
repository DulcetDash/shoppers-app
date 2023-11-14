import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:shoppers_app/Components/Helpers/DateParser.dart';
import 'package:shoppers_app/Components/Helpers/Networking.dart';
import 'package:shoppers_app/Components/Helpers/RequestCardHelper.dart';
import 'package:shoppers_app/Components/Home/TripDetails.dart';
import 'package:shoppers_app/Components/Home/TripDetails_Delivery.dart';
import 'package:shoppers_app/Components/Home/TripDetails_Shopping.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

//The request card that showcase all the important requests infos.
class RequestCard_Shopping extends StatelessWidget {
  final Map requestData;

  const RequestCard_Shopping({Key? key, required this.requestData})
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
                                      ['inRouteToShop']
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
                      onTap: () => showBarModalBottomSheet(
                          backgroundColor: Colors.white,
                          duration: const Duration(milliseconds: 250),
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
                                    child: requestData['request_fp'] == null
                                        ? SizedBox.shrink()
                                        : ShowProductsQuick(
                                            requestData: requestData),
                                  )),
                            );
                          }),
                      leading: Container(
                        width: 40,
                        height: 40,
                        // color: Colors.red,
                        child: Image.asset(
                          'assets/Images/shopping.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shopping',
                            style: TextStyle(
                                fontFamily: 'MoveTextMedium',
                                fontSize: 15,
                                color: AppTheme().getGenericDarkGrey()),
                          ),
                          Text(
                            'See products',
                            style: TextStyle(
                                color: AppTheme().getGenericDarkGrey(),
                                fontSize: 15),
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
                            'N\$${double.parse(requestData['delivery_basic_infos']['totals_delivery']['service_fee'].toString().replaceAll('N\$', '')) + double.parse(requestData['delivery_basic_infos']['totals_delivery']['cash_pickup_fee'].toString().replaceAll('N\$', ''))}',
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
                ? AppTheme().getPrimaryColor()
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
                          return const TripDetails_Shopping();
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
                                                    locationData: requestData[
                                                            'origin_destination_infos']
                                                        ['destination_infos']),
                                          ),
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

//Show all the products required
class ShowProductsQuick extends StatelessWidget {
  final Map requestData;
  const ShowProductsQuick({Key? key, required this.requestData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(requestData);
    return SafeArea(
      top: false,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${requestData['delivery_basic_infos']['shopping_list'].length}',
                            style: const TextStyle(
                                fontFamily: 'MoveTextMedium', fontSize: 16),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Text(
                                'item${requestData['delivery_basic_infos']['shopping_list'].length > 1 ? 's' : ''}'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            requestData['delivery_basic_infos']
                                ['totals_delivery']['total'],
                            style: TextStyle(
                                fontFamily: 'MoveBold',
                                fontSize: 19,
                                color: AppTheme().getPrimaryColor()),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                      itemBuilder: (context, index) => ProductModel(
                            indexProduct: index + 1,
                            productData: requestData['delivery_basic_infos']
                                ['shopping_list'][index],
                          ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: requestData['delivery_basic_infos']
                              ['shopping_list']
                          .length))
            ],
          )),
    );
  }
}

//Product model
class ProductModel extends StatelessWidget {
  final Map<String, dynamic> productData;
  final int indexProduct;

  const ProductModel(
      {Key? key, required this.productData, required this.indexProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              width: 30,
              child: Text(
                indexProduct.toString(),
                style: TextStyle(fontSize: 17),
              )),
          Container(
              // color: Colors.red,
              width: 70,
              height: 60,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: productData['pictures'][0].runtimeType.toString() ==
                        'List<dynamic>'
                    ? productData['pictures'][0][0]
                    : productData['pictures'][0],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 20.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  size: 30,
                  color: Colors.grey,
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productData['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontFamily: 'MoveText'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${getItemsNumber()} •  ${productData['meta']['store']}',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontFamily: 'MoveTextMedium'),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          Container(
            child: Column(
              children: [
                Text(
                  'N\$${productData['price']}',
                  style: TextStyle(
                      fontSize: 15, color: AppTheme().getPrimaryColor()),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  //Get the number of items
  String getItemsNumber() {
    int items = productData['items'];

    if (items == 0 || items > 1) {
      return '$items items';
    } else {
      return '$items item';
    }
  }
}
