import 'package:flutter/material.dart';

import '../providers/data_provider.dart';

import 'package:provider/provider.dart';

class OneSideCurveContainer extends StatelessWidget {
  var mode = false;
  final child, mediaquery, color;
  final double size, shadowRadius, radiusMultiplier, paddingMultiplier, height;
  final double width;
  OneSideCurveContainer({
    @required this.size,
    @required this.mediaquery,
    this.child,
    this.height = -1,
    this.width,
    this.shadowRadius = 10,
    this.radiusMultiplier = 0.1,
    this.paddingMultiplier = 0.08,
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    // print('color from oneside.... : $color');
    mode = Provider.of<DataProvider>(context).mode;
    return Padding(
      padding: EdgeInsets.only(
        top: size * paddingMultiplier,
      ),
      child: Container(
        height: (height != -1) ? height : mediaquery.height,
        width: (width != -1) ? width : double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: shadowRadius + 15,
              color: (!mode) ? Colors.black : Colors.white,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              size * radiusMultiplier,
            ),
          ),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
