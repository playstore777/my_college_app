import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'bsc_screen.dart';
import 'bcom/bcom_details.dart';

class AllCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    final List<String> titles = <String>[
      'BSc',
      'BCom',
      'BBA',
    ];

    final List<Widget> images = <Widget>[
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          BScScreen.routeName,
        ),
        child: Card(
          // width: screenWidth * 0.8,
          // height: screenHeight * 0.04,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.red,
          // child: Center(
          //   child: Text(
          //     'BSc',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          BComDetails.routeName,
        ),
        child: Card(
          // width: screenWidth * 0.8,
          // height: screenHeight * 0.04,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.blue,
          // child: Center(
          //   child: Text(
          //     'BCom',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
        ),
      ),
      GestureDetector(
        // onTap: () => Navigator.of(context).pushNamed(
        //   BScScreen.routeName,
        // ),
        onTap: () {},
        child: Card(
          // width: screenWidth * 0.8,
          // height: screenHeight * 0.04,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.green,
          // child: Center(
          //   child: Text(
          //     'BBA',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('All Courses'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: VerticalCardPager(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                titles: titles,
                images: images,
                onSelectedItem: (index) {
                  // print('index of vertical card pager : $index');
                  switch (index) {
                    case 0:
                      Navigator.of(context).pushNamed(BScScreen.routeName);
                      break;
                    case 1:
                      Navigator.of(context).pushNamed(BComDetails.routeName);
                      break;
                  }
                },
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GestureDetector(
          //     onTap: () => Navigator.of(context).pushNamed(
          //       BScScreen.routeName,
          //     ),
          //     child: Container(
          //       width: screenWidth * 0.8,
          //       height: screenHeight * 0.04,
          //       child: Center(
          //         child: Text(
          //           'BSc',
          //           style: TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GestureDetector(
          //     onTap: () => Navigator.of(context).pushNamed(
          //       BComDetails.routeName,
          //     ),
          //     child: Container(
          //       width: screenWidth * 0.8,
          //       height: screenHeight * 0.04,
          //       child: Center(
          //         child: Text(
          //           'BCom',
          //           style: TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
