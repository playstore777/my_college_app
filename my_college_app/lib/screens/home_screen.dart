// flutter Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// dependencies
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';

// App Packages
import 'anti_ragging_screen.dart';
import 'notes_screen.dart';
import 'payment_screen.dart';
import 'courses/all_courses.dart';
import 'courses/bsc_screen.dart';
import 'courses/bcom/bcom_details.dart';
import '/constants.dart';
import '/resuable_ui/landscape_screen.dart';
import '/resuable_ui/reusable_container.dart';
import '/resuable_ui/tutorial.dart';
import '/widgets/app_drawer.dart';
import '/widgets/home_card.dart';

final userDetails = FirebaseAuth.instance.currentUser;

class HomeScreen extends StatefulWidget {
  static const routeName = 'Home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _user = FirebaseAuth.instance.currentUser;
  final websiteNavigationKey = GlobalKey();
  final courseKey = GlobalKey();
  final notesKey = GlobalKey();
  final paymentKey = GlobalKey();
  final antiRaggingKey = GlobalKey();
  bool isTutCompleted = false;

  @override
  void initState() {
    checkTutsStatus();
    super.initState();
  }

  void checkTutsStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isTutCompleted = prefs.getBool('tutsStatus');

    if (isTutCompleted == null) {
      // it will only be null for the first time.
      prefs.setBool('tutsStatus', true);
      ShowCaseWidget.of(context).startShowCase(
        [
          websiteNavigationKey,
          courseKey,
          notesKey,
          paymentKey,
          antiRaggingKey,
        ],
      );
    }
  }

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
                  if (_user.displayName == null)
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        // Provider.of<DataProvider>(context).close();
                      },
                    ),
                  if (_user.displayName != null)
                    Tutorial(
                      globalKey: websiteNavigationKey,
                      description: 'You can visit the college Website here',
                      child: IconButton(
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
                      ),
                    )
                ],
                elevation: 0.0,
              ),
              body: LayoutBuilder(
                builder: (ctx, boxConstraints) => SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Tutorial(
                        globalKey: courseKey,
                        description: 'Here you can find your Course details',
                        child: HomeCard(
                          // can say Completed?, I guess!
                          name: Constants.homeCardCourseName,
                          icon: Icons.book,
                          color: Colors.pinkAccent[400],
                          onPress: () {
                            if (userDetails.email.contains('467') ||
                                userDetails.email.contains('468') ||
                                userDetails.email.contains('474')) {
                              return Navigator.of(context)
                                  .pushNamed(BScScreen.routeName);
                            } else if (userDetails.email.contains('401')) {
                              return Navigator.of(context)
                                  .pushNamed(BComDetails.routeName);
                            } else {
                              return Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => AllCourses(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Tutorial(
                        globalKey: notesKey,
                        description: 'Here you can Add your notes',
                        child: HomeCard(
                          // Done Completed!
                          name: 'Notes',
                          icon: Icons.event_note_sharp,
                          color: CupertinoColors.systemBlue,
                          onPress: () => Navigator.of(context).pushNamed(
                            NotesScreen.routeName,
                          ),
                        ),
                      ),
                      Tutorial(
                        globalKey: paymentKey,
                        description: 'Here you can do all the payments',
                        child: HomeCard(
                          name: Constants.homeCardPaymentName,
                          icon: Icons.account_balance_wallet,
                          color: CupertinoColors.systemOrange,
                          onPress: () => Navigator.of(context).pushNamed(
                            PaymentScreen.routeName,
                          ),
                        ),
                      ),
                      Tutorial(
                        globalKey: antiRaggingKey,
                        description:
                            'Here you can find support for Anti-Ragging',
                        child: HomeCard(
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
