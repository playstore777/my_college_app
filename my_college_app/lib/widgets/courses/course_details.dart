import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  final course, subjects, seats, semesters, onPress;
  CourseDetails({
    this.course,
    this.seats,
    this.semesters,
    this.subjects,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var padding = size.width + size.height;
    return Padding(
      padding: EdgeInsets.only(
        left: padding * 0.03,
        top: padding * 0.02,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColor,
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(3, 3),
            //     blurRadius: 5,
            //     color: Colors.pinkAccent,
            //   ),
            //   BoxShadow(
            //     offset: Offset(-3, -3),
            //     blurRadius: 5,
            //     color: Colors.pinkAccent,
            //   ),
            // ],
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Theme.of(context).primaryColor,
            //     Theme.of(context).accentColor,
            //   ],
            // ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: size.width * 0.8,
                height: size.height * 0.06,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Course Name',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      course,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                height: size.height * 0.06,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Subjects',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      subjects,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                height: size.height * 0.06,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Semesters',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      semesters,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                height: size.height * 0.06,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Seats',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      seats,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
