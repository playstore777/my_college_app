import 'package:flutter/material.dart';
import 'package:my_college_app/resuable_ui/oneside_curve_container.dart';
import 'package:my_college_app/resuable_ui/reusable_container.dart';

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
              body: SingleChildScrollView(
                child: OneSideCurveContainer(
                  // color: Colors.transparent,
                  size: size,
                  mediaquery: mediaQuerySize,
                  height: mediaQuerySize.height,
                  child: Padding(
                    padding: EdgeInsets.all(size * 0.05),
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
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(20),
      title: Text(
        'Name of the Person',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          // color: Colors.white,
        ),
      ),
      subtitle: Text(
        '''Phone No. : +91 9874561230,
Email No. :- person@gmail.com''',
        style: TextStyle(
            // color: Colors.white,
            ),
      ),
    );
  }
}
