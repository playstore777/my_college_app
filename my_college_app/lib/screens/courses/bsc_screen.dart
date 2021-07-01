import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_college_app/resuable_ui/reusable_container.dart';
import 'package:my_college_app/screens/courses/bsc_details_screen.dart';

import '../../widgets/courses/course_details.dart';
import '../../resuable_ui/landscape_screen.dart';

class BScScreen extends StatelessWidget {
  final userDetails = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // print('BSc(MSCs) ${userDetails.email.contains('467')}');
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : ReusableContainer(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  'Science',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (userDetails.email.contains('467'))
                      CourseDetails(
                        course: 'BSc',
                        subjects: 'MSCs',
                        semesters: 'VI',
                        seats: '40',
                        onPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => BScDetailsScreen(),
                            ),
                          );
                        },
                      ),
                    if (userDetails.email.contains('464'))
                      CourseDetails(
                        course: 'BSc',
                        subjects: 'MECs',
                        semesters: 'VI',
                        seats: '40',
                      ),
                    if (userDetails.email.contains('474'))
                      CourseDetails(
                        course: 'BSc',
                        subjects: 'MPCs',
                        semesters: 'VI',
                        seats: '40',
                      ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
