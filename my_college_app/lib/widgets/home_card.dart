import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final name, icon, color, onPress;
  HomeCard({
    this.color,
    this.icon,
    this.name,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    var size = (mediaQuerySize.height + mediaQuerySize.width);
    var iconPadding = size * 0.02;
    var padding = size * 0.001;
    return InkWell(
      onTap: onPress,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: mediaQuerySize.width * 0.3,
            height: mediaQuerySize.height * 0.3,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: padding,
                horizontal: padding,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: padding,
                        horizontal: padding,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.white,
                              offset: Offset(5, 5),
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.white,
                              offset: Offset(-5, -5),
                            ),
                          ],
                        ),
                        child: RawMaterialButton(
                          onPressed: this.onPress,
                          shape: CircleBorder(),
                          elevation: 10.0,
                          fillColor: Color(0xfff2f3f7), // white color!
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: iconPadding,
                              horizontal: iconPadding,
                            ),
                            child: Icon(this.icon,
                                size: size * 0.05, color: this.color),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: mediaQuerySize.width -
                (mediaQuerySize.width *
                    0.4), // if gives error then go for 0.3 again!
            // height: mediaQuerySize.height - (mediaQuerySize.height * 0.3),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                this.name,
                style: TextStyle(
                  // shadows: <Shadow>[
                  //   Shadow(
                  //     offset: Offset(4, 4),
                  //     blurRadius: 15,
                  //     color: Colors.white,
                  //   ),
                  //   Shadow(
                  //     offset: Offset(2, 2),
                  //     blurRadius: 15,
                  //     color: Colors.white,
                  //   ),
                  //   Shadow(
                  //     offset: Offset(-2, -2),
                  //     blurRadius: 15,
                  //     color: Colors.white,
                  //   ),
                  //   Shadow(
                  //     offset: Offset(-4, -4),
                  //     blurRadius: 15,
                  //     color: Colors.white,
                  //   ),
                  // ],
                  fontSize: size * 0.05,
                  color: Colors.white,
                  // color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
