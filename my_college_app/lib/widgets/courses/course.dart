import 'package:flutter/material.dart';

class Course extends StatelessWidget {
  final title, onPress;
  Course({this.title, this.onPress});
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    var size = (mediaQuerySize.width + mediaQuerySize.height);
    return SafeArea(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          color: Colors.white,
          height: mediaQuerySize.height * 0.1,
          child: Column(
            children: <Widget>[
              Container(
                height: mediaQuerySize.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    // color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 5,
                        color: Colors.black12,
                      ),
                      BoxShadow(
                        offset: Offset(-3, -3),
                        blurRadius: 5,
                        color: Colors.black12,
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Flexible(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(
                                size * 0.01,
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size * 0.014,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: mediaQuerySize.height * 0.2,
                      width: mediaQuerySize.width * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                          BoxShadow(
                            offset: Offset(-3, -3),
                            color: Colors.white,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: size * 0.014,
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
