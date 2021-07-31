// flutter packages
import 'package:flutter/material.dart';

// App packages
import '/resuable_ui/landscape_screen.dart';
import '/resuable_ui/reusable_container.dart';
// import '/screens/courses/bsc_details_screen.dart';
import '/widgets/courses/course_details.dart';

// dependencies
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class BScScreen extends StatelessWidget {
  static const routeName = 'BScScreen';
  final userDetails = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : ReusableContainerDark(
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
                    CourseDetails(
                      course: 'BSc',
                      subjects: 'MSCs',
                      semesters: 'VI',
                      seats: '40',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_MSCS-1-min.pdf'),
                    ),
                    CourseDetails(
                      course: 'BSc',
                      subjects: 'MECs',
                      semesters: 'VI',
                      seats: '40',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_MECS-min.pdf'),
                    ),
                    CourseDetails(
                      course: 'BSc',
                      subjects: 'MPCs',
                      semesters: 'VI',
                      seats: '40',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_MPCS-min.pdf'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void _navigateToCourse(String link) async {
    final url = '$link';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
