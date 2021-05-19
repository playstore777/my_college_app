import 'package:flutter/material.dart';

import '../widgets/courses/course.dart';

class UndergraduateScreen extends StatelessWidget {
  static const routeName = 'undergraduate';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnderGraduate Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Course(
              title: 'BSc',
              onPress: () {},
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
    );
  }
}
