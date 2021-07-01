import 'package:flutter/material.dart';

class SemesterDetails extends StatelessWidget {
  final dataMap;
  SemesterDetails(this.dataMap);

  Widget tile(padding, subjectName, details) {
    return Padding(
      padding: EdgeInsets.only(
        left: padding * 0.02,
        top: padding * 0.01,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              'English - I',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '-',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var padding = size.width + size.height;
    return Center(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.05,
          ),
          child: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: padding * 0.02,
                    top: padding * 0.01,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Subject Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                tile(
                  padding,
                  dataMap[''],
                  dataMap[''],
                ),
                tile(
                  padding,
                  dataMap[''],
                  dataMap[''],
                ),
                tile(
                  padding,
                  dataMap[''],
                  dataMap[''],
                ),
                tile(
                  padding,
                  dataMap[''],
                  dataMap[''],
                ),
                tile(
                  padding,
                  dataMap[''],
                  dataMap[''],
                ),
                tile(
                  padding,
                  dataMap[''],
                  dataMap[''],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
