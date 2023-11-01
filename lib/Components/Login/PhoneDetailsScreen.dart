// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:shoppers_app/Components/Modules/GenericCircButton/GenericCircButton.dart';
import 'package:shoppers_app/Components/Modules/GenericRectButton/GenericRectButton.dart';
import 'package:shoppers_app/Components/Modules/PhoneNumberInput/PhoneNumberInputEntry.dart';

class PhoneDetailsScreen extends StatefulWidget {
  const PhoneDetailsScreen({Key? key}) : super(key: key);

  @override
  _PhoneDetailsScreenState createState() => _PhoneDetailsScreenState();
}

class _PhoneDetailsScreenState extends State<PhoneDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ListTile(
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back,
                        size: 33, color: Colors.black)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text("What's your phone number?",
                        style: TextStyle(
                            fontFamily: 'MoveTextBold',
                            fontSize: 22,
                            color: Colors.black))),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const PhoneNumberInputEntry(),
                  )),
              Expanded(
                child: SizedBox.shrink(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error,
                        size: 17,
                        color: AppTheme().getGenericDarkGrey(),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          'By continuing you will receive an SMS for verification. Message and data rates my apply.',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppTheme().getGenericDarkGrey()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GenericRectButton(
                horizontalPadding: 20,
                label: 'Next',
                labelFontSize: 20,
                isArrowShow: true,
                actuatorFunctionl: () => Navigator.pushNamed(
                  context,
                  '/OTPVerificationEntry',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
