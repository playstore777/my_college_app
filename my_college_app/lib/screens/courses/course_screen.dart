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
                        child: OneSideCurveContainer(
                          paddingMultiplier: 0.01,
                          color: Colors.pink,
                          size: size,
                          mediaquery: mediaQuerySize,
                          height: mediaQuerySize.height * 0.7,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 125,
                              left: 25,
                              bottom: 20,
                              right: 20,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 20,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: size * 0.46,
                  //   right: size * 0.05,
                  //   child: Container(
                  //     height: 40,
                  //     width: 40,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(13.0),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: size * 0.46,
                  //   left: size * 0.05,
                  //   child: Container(
                  //     height: 40,
                  //     width: 40,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(13.0),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
  }
}
