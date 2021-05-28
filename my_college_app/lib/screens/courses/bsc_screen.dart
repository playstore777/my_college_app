import 'package:flutter/material.dart';
import 'package:my_college_app/screens/courses/bsc_details_screen.dart';

import '../../widgets/courses/course_details.dart';

class BScScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ])),
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
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => BScDetailsScreen(),
                    ),
                  );
                },
              ),
              CourseDetails(
                course: 'BSc',
                subjects: 'MECs',
                semesters: 'VI',
                seats: '40',
              ),
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
