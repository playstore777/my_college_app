import 'package:flutter/material.dart';

class AntiRaggingScreen extends StatelessWidget {
  static const routeName = 'Anti-Ragging';

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
          title: Text('Anti Ragging'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                // SizedBox(
                //   height: 50,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(50),
                //         topRight: Radius.circular(50),
                //       )),
                //   padding: EdgeInsets.all(50),
                //   child: Column(
                //     children: [
                AntiRaggingCard(),
                AntiRaggingCard(),
                AntiRaggingCard(),
                AntiRaggingCard(),
                //       SizedBox(
                //         height: 250,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AntiRaggingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(20),
      title: Text(
        'Name of the Person',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        '''Phone No. : +91 9874561230,
Email No. :- person@gmail.com''',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
