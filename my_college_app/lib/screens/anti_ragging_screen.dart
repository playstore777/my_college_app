import 'package:flutter/material.dart';
import 'package:my_college_app/resuable_ui/oneside_curve_container.dart';
import 'package:my_college_app/resuable_ui/reusable_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resuable_ui/landscape_screen.dart';

class AntiRaggingScreen extends StatelessWidget {
  static const routeName = 'Anti-Ragging';

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    var size = (mediaQuerySize.width + mediaQuerySize.height);
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : ReusableContainerDark(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text('Anti Ragging'),
              ),
              body: OneSideCurveContainer(
                size: size,
                mediaquery: mediaQuerySize,
                height: mediaQuerySize.height,
                child: Padding(
                  padding: EdgeInsets.all(size * 0.05),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // SizedBox(
                        //   height: 50,
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(50),
                        //         topRight: Radius.circular(50),
                        //       )),
                        //   padding: EdgeInsets.all(50),
                        //   child: Column(
                        //     children: [
                        AntiRaggingCard(),
                        AntiRaggingCard(),
                        AntiRaggingCard(),
                        AntiRaggingCard(),
                        //       SizedBox(
                        //         height: 250,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

class AntiRaggingCard extends StatelessWidget {
  final name, phoneNumber, email;
  AntiRaggingCard({
    this.name = 'Name of the Person',
    this.phoneNumber = '91 9874561230',
    this.email = 'person@gmail.com',
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () => _sendingMails(email),
          contentPadding: EdgeInsets.all(20),
          title: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
          subtitle: Text(
            '''Phone No. : +$phoneNumber,
Email No. :- $email''',
            style: TextStyle(
                // color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }

  void _sendingMails(email) async {
    final url = '$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
