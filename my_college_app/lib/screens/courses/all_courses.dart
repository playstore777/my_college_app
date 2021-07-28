import 'package:flutter/material.dart';

import 'bsc_screen.dart';
import 'bcom/bcom_details.dart';

class AllCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('All Courses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                BScScreen.routeName,
              ),
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.04,
                child: Center(
                  child: Text(
                    'BSc',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                BComDetails.routeName,
              ),
              child: Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.04,
                child: Center(
                  child: Text(
                    'BCom',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
