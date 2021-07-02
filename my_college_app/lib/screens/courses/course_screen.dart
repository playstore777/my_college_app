import 'package:flutter/material.dart';

// import '../../widgets/courses/course.dart';
import 'undergraduate_screen.dart';
import '../../resuable_ui/oneside_curve_container.dart';
import '../../resuable_ui/reusable_container.dart';
import '../../resuable_ui/landscape_screen.dart';
import '../../constants.dart';

class CourseScreen extends StatelessWidget {
  static const routeName = 'course';
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
                backgroundColor: Colors.transparent,
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
              body: Stack(
                children: [
                  OneSideCurveContainer(
                    size: size,
                    // padding: EdgeInsets.only(top: size * 0.08, left: size * 0.01),
                    mediaquery: mediaQuerySize,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          UndergraduateScreen.routeName,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
