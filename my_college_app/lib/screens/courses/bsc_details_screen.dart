import 'package:flutter/material.dart';

import '/resuable_ui/reusable_container.dart';
import '../../widgets/courses/semester_details.dart';
import '../../resuable_ui/landscape_screen.dart';

class BScDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = size.width + size.height;
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : ReusableContainerDark(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text('Details'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(padding * 0.02),
                      child: SemesterDetails({}),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding * 0.02),
                      child: SemesterDetails({}),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding * 0.02),
                      child: SemesterDetails({}),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding * 0.02),
                      child: SemesterDetails({}),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding * 0.02),
                      child: SemesterDetails({}),
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding * 0.02),
                      child: SemesterDetails({}),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
