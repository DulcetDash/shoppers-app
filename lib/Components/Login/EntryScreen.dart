// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'PhoneDetailsScreen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed('/PhoneDetailsScreen'),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: AppTheme().getSecondaryColor()),
                  child: SafeArea(
                      child: Column(
                    children: [
                      Container(
                          width: 200,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset(
                              'assets/Images/logo_white.png',
                              fit: BoxFit.contain,
                            ),
                          )),
                      Expanded(
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        // decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Image.asset('assets/Images/shopper.png',
                            fit: BoxFit.fitWidth),
                      )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.red,
                        height: 100,
                        alignment: Alignment.center,
                        child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: FittedBox(
                              child: Text('Shoppers app',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontFamily: 'MoveBold')),
                            )),
                      ),
                    ],
                  )),
                ),
              )),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed('/PhoneDetailsScreen'),
              child: Container(
                // color: Colors.red,
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SafeArea(
                      child: Container(
                    child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          size: 25,
                          color: Colors.black,
                        ),
                        title: Text("Enter your phone number",
                            style: TextStyle(
                                fontFamily: 'MoveTextRegular',
                                fontSize: 20,
                                color: Colors.black)),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.black)),
                  )),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
