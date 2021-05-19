import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/calendar_screen.dart';
import '../screens/course_screen.dart';
import '../screens/payment_screen.dart';
import '../widgets/home_card.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://wallpaper.dog/large/11032781.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // leading: Drawer( // commented because of the color Issue!
          //   // for Login etc!

          //   child: IconButton(
          //     color: Colors.black,
          //     icon: Icon(Icons.menu),
          //     onPressed: () {},
          //   ),
          // ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              Constants.appBarName,
              style: TextStyle(
                // color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.05,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
                color: Colors.black,
                icon: Icon(
                  Icons.navigate_next,
                ),
                onPressed: () {})
          ],
          elevation: 6.0,
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
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
