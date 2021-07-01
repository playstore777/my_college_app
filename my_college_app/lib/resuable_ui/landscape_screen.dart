import 'package:flutter/material.dart';

class LandscapeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(
          'Currently we don\'t support Landscape orientation',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
