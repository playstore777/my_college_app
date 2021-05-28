import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/home_card.dart';
import 'calendar_screen.dart';
import 'courses/course_screen.dart';
import 'payment_screen.dart';
import 'anti_ragging_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home-screen';
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
            // Colors.teal.withOpacity(1),
            // Colors.pink.withOpacity(1),
          ],
        ),
      ),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('images/background_images/bg_blue_moon.jpg'),
      //       // image: AssetImage('assets/images/background_images/bg_blue_moon.jpg'),
      //       fit: BoxFit.cover,
      //     ),
      //     ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              Constants.appBarName,
              style: TextStyle(
                // color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.038,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.subdirectory_arrow_right_outlined,
                ),
                onPressed: () async {
                  const url = 'https://josephscollege.ac.in/';
                  if (await canLaunch(url)) {
                    await launch(url, forceWebView: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                  // await FirebaseAuth.instance.signOut();
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (ctx) => AuthScreen(),
                  //   ),
                  // );
                })
          ],
          elevation: 0.0,
        ),
        body: LayoutBuilder(
          builder: (ctx, boxConstraints) => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HomeCard(
                  // can say Completed?, I guess!
                  name: Constants.homeCardCourseName,
                  icon: Icons.book,
                  color: Colors.pinkAccent[400],
                  onPress: () => Navigator.of(context).pushNamed(
                    CourseScreen.routeName,
                  ),
                ),
                HomeCard(
                  // Still Incomplete!
                  name: Constants.homeCardCalendarName,
                  icon: Icons.calendar_today,
                  color: CupertinoColors.systemBlue,
                  onPress: () => Navigator.of(context).pushNamed(
                    CalendarScreen.routeName,
                  ),
                ),
                HomeCard(
                  name: Constants.homeCardPaymentName,
                  icon: Icons.account_balance_wallet,
                  color: CupertinoColors.systemOrange,
                  onPress: () => Navigator.of(context).pushNamed(
                    PaymentScreen.routeName,
                  ),
                ),
                HomeCard(
                  name: Constants.homeCardAntiRaggingName,
                  icon: Icons.not_interested,
                  color: CupertinoColors.systemGreen,
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      AntiRaggingScreen.routeName,
                    );
                  },
                ),
                Text(
                  'Crafted With ❤',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
