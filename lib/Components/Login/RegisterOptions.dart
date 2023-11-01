import 'package:flutter/material.dart';
import 'package:shoppers_app/Components/Helpers/AppTheme.dart';
import 'package:provider/src/provider.dart';
import 'package:shoppers_app/Components/Providers/HomeProvider.dart';
import 'package:shoppers_app/Components/Providers/RegistrationProvider.dart';

class RegisterOptions extends StatefulWidget {
  const RegisterOptions({Key? key}) : super(key: key);

  @override
  _RegisterOptionsState createState() => _RegisterOptionsState();
}

class _RegisterOptionsState extends State<RegisterOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 5, top: 0),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 45, top: 30),
            child: Text('Register as',
                style: TextStyle(fontFamily: 'MoveBold', fontSize: 28)),
          ),
          Options(
            title: 'Shopper',
            subTitle:
                'To make parcels delivery and to be able to make shopping.',
            icoRepr: Icons.widgets,
            actuator: () {
              //!Deactivate the blur
              context
                  .read<HomeProvider>()
                  .updateBlurredBackgroundState(shouldShow: false);
              //Update the driver nature
              context
                  .read<RegistrationProvider>()
                  .updateSelectedDriverNature(data: 'COURIER');
              Navigator.of(context).pushNamed('/RegistrationDelivery');
            },
          )
        ],
      )),
    );
  }
}

class Options extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icoRepr;
  final actuator;

  const Options(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icoRepr,
      required this.actuator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: actuator,
        horizontalTitleGap: 5,
        leading: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(200)),
            child: Icon(icoRepr, color: Colors.black)),
        title: Text(title,
            style: TextStyle(
                fontFamily: 'MoveTextMedium',
                color: Colors.black,
                fontSize: 18)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            subTitle,
            style: TextStyle(fontSize: 15),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: 17, color: AppTheme().getPrimaryColor()));
  }
}
