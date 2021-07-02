import 'package:flutter/material.dart';

import '../../resuable_ui/landscape_screen.dart';
import 'bsc_screen.dart';
import '../../widgets/courses/course.dart';

class UndergraduateScreen extends StatelessWidget {
  static const routeName = 'undergraduate';
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor.withOpacity(0.5),
                ])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Text('UnderGraduate Courses'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Course(
                      title: 'BSc',
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => BScScreen(),
                        ));
                      },
                    ),
                    Course(
                      title: 'BCom',
                      onPress: () {},
                    ),
                    Course(
                      title: 'BBA',
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
