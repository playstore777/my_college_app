import 'package:flutter/material.dart';

import 'screens/anti_ragging_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/courses/undergraduate_screen.dart';
import 'screens/courses/course_screen.dart';
import 'screens/home_screen.dart';
import 'screens/calendar_screen.dart';
import 'auth/screens/auth_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.purple,
      ),
      // darkTheme: ThemeData.dark().copyWith(
      //   accentColor: Colors.white,
      // ),

      // home: HomeScreen(),
      home: StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print('userSnapshot from main.dart: $userSnapshot');
          if (userSnapshot.hasData) {
            // hasData means we have the token, else the user is not logged in!
            // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

            return HomeScreen();
          }
          return AuthScreen();
        },
      ),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        CourseScreen.routeName: (_) => CourseScreen(),
        UndergraduateScreen.routeName: (_) => UndergraduateScreen(),
        CalendarScreen.routeName: (_) => CalendarScreen(),
        PaymentScreen.routeName: (_) => PaymentScreen(),
        AntiRaggingScreen.routeName: (_) => AntiRaggingScreen(),
      },
    );
  }
}
