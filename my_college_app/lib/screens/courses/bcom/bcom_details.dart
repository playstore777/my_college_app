import 'package:flutter/material.dart';

import '/resuable_ui/landscape_screen.dart';
import '/resuable_ui/reusable_container.dart';
import '/widgets/courses/course_details.dart';

import 'package:url_launcher/url_launcher.dart';

class BComDetails extends StatelessWidget {
  static const routeName = 'BCom';
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
                  'Commerce',
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
                      course: 'BCom General',
                      subjects: '',
                      semesters: 'VI',
                      seats: '120',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_Gen.pdf'),
                    ),
                    CourseDetails(
                      course: 'BCom Computers',
                      subjects: '',
                      semesters: 'VI',
                      seats: '120',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_Comp.pdf'),
                    ),
                    CourseDetails(
                      course: 'BCom Honors',
                      subjects: '',
                      semesters: 'VI',
                      seats: '60',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_Hon.pdf'),
                    ),
                    CourseDetails(
                      course: 'BCom Prof',
                      subjects: '',
                      semesters: 'VI',
                      seats: '60',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_Prof.pdf'),
                    ),
                    CourseDetails(
                      course: 'BCom IT',
                      subjects: '',
                      semesters: 'VI',
                      seats: '60',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_IT.pdf'),
                    ),
                    CourseDetails(
                      course: 'BCom IFA',
                      subjects: '',
                      semesters: 'VI',
                      seats: '60',
                      onPress: () => _navigateToCourse(
                          'https://josephscollege.ac.in/wp-content/uploads/2021/02/Phase-3_IFA.pdf'),
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
