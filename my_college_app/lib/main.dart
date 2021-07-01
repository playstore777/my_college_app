import 'package:flutter/material.dart';

import 'providers/mode_preferences_provider.dart';
import 'screens/anti_ragging_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/courses/undergraduate_screen.dart';
import 'screens/courses/course_screen.dart';
import 'screens/home_screen.dart';
// import 'screens/calendar_screen.dart';
import 'screens/notes_screen.dart';
import 'screens/notes/notes_edit_screen.dart';
import 'auth/screens/auth_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:device_preview/device_preview.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      builder: (ctx) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ModePreferencesProvider(),
      child: MaterialApp(
        locale: DevicePreview.locale(context), // Add the locale here
        builder: DevicePreview.appBuilder, // Add the builder here
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
        home: AnimatedSplashScreen(
          splash: 'assets/gifs/loading1.gif',
          splashIconSize: 300,
          nextScreen: AppStart(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.black,
          // pageTransitionType: PageTransitionType.scale,
        ),
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          CourseScreen.routeName: (_) => CourseScreen(),
          UndergraduateScreen.routeName: (_) => UndergraduateScreen(),
          NotesScreen.routeName: (_) => NotesScreen(),
          // CalendarScreen.routeName: (_) => CalendarScreen(),
          PaymentScreen.routeName: (_) => PaymentScreen(),
          AntiRaggingScreen.routeName: (_) => AntiRaggingScreen(),
          NotesEditScreen.routeName: (_) => NotesEditScreen(),
        },
      ),
    );
  }
}

class AppStart extends StatelessWidget {
  const AppStart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
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
    );
  }
}
