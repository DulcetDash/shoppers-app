import 'package:flutter/material.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppers_app/Components/Helpers/CarsBrandsModels.dart';
import 'package:shoppers_app/Components/Providers/RegistrationProvider.dart';

class SelectCarDirectory extends StatefulWidget {
  const SelectCarDirectory({Key? key}) : super(key: key);

  @override
  _SelectCarDirectoryState createState() => _SelectCarDirectoryState();
}

class _SelectCarDirectoryState extends State<SelectCarDirectory> {
  List<Map<String, dynamic>> carsData = CarsBrandsModels().cars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            padding: EdgeInsets.only(left: 0),
            visualDensity: VisualDensity.comfortable,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back),
          ),
          title: const Text('Vehicle',
              style: TextStyle(fontFamily: 'MoveTextRegular', fontSize: 20)),
        ),
        body: Container(
          // color: Colors.red,
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      onChanged: (valueSearch) {
                        setState(() {
                          if (valueSearch.isNotEmpty) {
                            List<Map<String, dynamic>> originalList =
                                CarsBrandsModels().cars;

                            carsData = originalList
                                .where((u) => (u['brand']
                                    .toLowerCase()
                                    .contains(valueSearch.toLowerCase())))
                                .toList();
                          } else //Original list
                          {
                            carsData = CarsBrandsModels().cars;
                          }
                        });
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          label: Text('Search vehicle brand'),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme().getSecondaryColor()),
                              borderRadius: BorderRadius.circular(1)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(1))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  showListBrands(context: context)
                ]),
          ),
        ));
  }

  //SHow list of cars brands
  Widget showListBrands({required BuildContext context}) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) =>
              genericTileData(context: context, brand: carsData[index]),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
              ),
          itemCount: carsData.length),
    );
  }

  //Generic tile data
  Widget genericTileData({required BuildContext context, required Map brand}) {
    return ListTile(
      onTap: () {
        //Update the select vehicle
        context.read<RegistrationProvider>().updateVehicleBrand(brand: brand);
        //Go to next page
        Navigator.of(context).pushNamed('/SelectCarModels');
      },
      contentPadding: EdgeInsets.only(left: 20, right: 20),
      title: Text(
        brand['brand'],
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppTheme().getSecondaryColor(),
        size: 18,
      ),
    );
  }
}
