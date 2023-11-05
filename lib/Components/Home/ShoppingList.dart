import 'dart:async';
import 'dart:developer';

import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:shimmer/shimmer.dart';

class ShoppingList extends StatelessWidget {
  ShoppingList({Key? key}) : super(key: key);

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
                          'My shopping list',
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
            height: 60,
            color: context.watch<HomeProvider>().isTheShoppingListCompleted(
                    packagesList: requestData['delivery_basic_infos']
                        ['shopping_list'])
                ? AppTheme().getPrimaryColor()
                : requestData['delivery_basic_infos']['didPickupCash'] == true
                    ? AppTheme().getGenericGrey().withOpacity(0.5)
                    : AppTheme().getErrorColor(),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                context.watch<HomeProvider>().isTheShoppingListCompleted(
                        packagesList: requestData['delivery_basic_infos']
                            ['shopping_list'])
                    ? 'Kudos to you! All the items were successfully bought.'
                    : requestData['delivery_basic_infos']['didPickupCash'] ==
                            true
                        ? 'Click on the individual items to confirm the purchase.'
                        : 'Please first confirm that you\'ve received the money before accessing your shopping list.',
                style: TextStyle(
                    fontSize: 14,
                    color: context
                            .watch<HomeProvider>()
                            .isTheShoppingListCompleted(
                                packagesList:
                                    requestData['delivery_basic_infos']
                                        ['shopping_list'])
                        ? Colors.white
                        : requestData['delivery_basic_infos']
                                    ['didPickupCash'] ==
                                true
                            ? Colors.black
                            : Colors.white),
              ),
            ),
          ),
          Expanded(
              child: Opacity(
            opacity:
                requestData['delivery_basic_infos']['didPickupCash'] == true
                    ? 1
                    : AppTheme().getFadedOpacityValue(),
            child: Container(
              child: ListView.separated(
                  padding: EdgeInsets.only(left: 0, right: 0, top: 35),
                  itemBuilder: (context, index) {
                    return ProductModel(
                        productData: requestData['delivery_basic_infos']
                            ['shopping_list'][index],
                        indexProduct: index,
                        isConfirmedPickup: requestData['delivery_basic_infos']
                            ['didPickupCash']);
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 50,
                      ),
                  itemCount: requestData['delivery_basic_infos']
                          ['shopping_list']
                      .length),
            ),
          ))
        ],
      ),
    ));
  }
}

//Product model
class ProductModel extends StatelessWidget {
  final Map<String, dynamic> productData;
  final int indexProduct;
  final bool isConfirmedPickup;

  const ProductModel(
      {Key? key,
      required this.productData,
      required this.indexProduct,
      required this.isConfirmedPickup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    productData['isCompleted'] = context
            .watch<HomeProvider>()
            .tmpSelectedTripData['delivery_basic_infos']['shopping_list']
        [indexProduct]['isCompleted'];

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: InkWell(
          onTap: productData['isCompleted'] != null
              ? () {}
              : isConfirmedPickup == false
                  ? () {}
                  : () {
                      //! Update the selected package index - very important
                      context
                          .read<HomeProvider>()
                          .updateSelectedPackageIndexForDelivery(
                              index: indexProduct);
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 30,
                  child: Text(
                    '${indexProduct + 1}',
                    style: TextStyle(fontSize: 17),
                  )),
              Container(
                  // color: Colors.red,
                  width: 70,
                  height: 60,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl:
                        productData['pictures'][0].runtimeType.toString() ==
                                'List<dynamic>'
                            ? productData['pictures'][0][0]
                            : productData['pictures'][0],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${getItemsNumber()} •  ${productData['meta']['store']}',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontFamily: 'MoveTextMedium'),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      productData['price'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'MoveTextMedium',
                          color: AppTheme().getPrimaryColor()),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox.shrink()),
              badges.Badge(
                badgeContent: productData['isCompleted'] != null
                    ? Icon(
                        Icons.check,
                        size: 15,
                        color: productData['isCompleted'] != null
                            ? Colors.white
                            : Colors.black,
                      )
                    : Icon(Icons.timelapse_sharp, size: 15),
                badgeColor: productData['isCompleted'] != null
                    ? AppTheme().getPrimaryColor()
                    : AppTheme().getGenericGrey(),
                position: badges.BadgePosition.center(),
                child: null,
              ),
            ],
          ),
        ),
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
