import 'package:flutter/material.dart';

import '../widgets/courses/course.dart';
import '../screens/undergraduate_screen.dart';
import '../constants.dart';

class CourseScreen extends StatelessWidget {
  static const routeName = 'course';
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    var size = (mediaQuerySize.width + mediaQuerySize.height);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          Constants.homeCardCourseName,
          style: TextStyle(
            fontSize: size * 0.025,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Course(
            title: 'Under-Graduate (U.G)',
            onPress: () => Navigator.of(context).pushNamed(
              UndergraduateScreen.routeName,
            ),
          )
        ],
      ),
    );
  }
}
