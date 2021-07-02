import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_college_app/screens/courses/bsc_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'notes_screen.dart';
import 'payment_screen.dart';
import 'anti_ragging_screen.dart';
import '/constants.dart';
import '/widgets/home_card.dart';
import '/widgets/app_drawer.dart';
import '/resuable_ui/landscape_screen.dart';
import '/resuable_ui/reusable_container.dart';

final userDetails = FirebaseAuth.instance.currentUser;

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home-screen';
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? LandscapeScreen()
        : ReusableContainerDark(
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
                    tooltip: 'Navigate to Website',
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
                    },
                  )
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
                        onPress: () {
                          if (userDetails.email.contains('467')) {
                            return Navigator.of(context)
                                .pushNamed(BScScreen.routeName);
                          }
                        },
                      ),
                      HomeCard(
                        // Done Completed!
                        name: 'Notes',
                        icon: Icons.event_note_sharp,
                        color: CupertinoColors.systemBlue,
                        onPress: () => Navigator.of(context).pushNamed(
                          NotesScreen.routeName,
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
