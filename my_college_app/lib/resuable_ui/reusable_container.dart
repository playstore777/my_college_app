import 'package:flutter/material.dart';

import '../providers/mode_preferences_provider.dart';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

// bool mode = false;
// Future<void> modePreference() async {
//   final prefs = await SharedPreferences.getInstance();
//   mode = prefs.getBool('_isDark');
//   mode = (mode == null) ? false : mode;
// }

class ReusableContainer extends StatelessWidget {
  final child;
  ReusableContainer({this.child});
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
      child: child,
    );
  }
}

class ReusableContainerDark extends StatefulWidget {
  final child;
  ReusableContainerDark({this.child});

  @override
  _ReusableContainerDarkState createState() => _ReusableContainerDarkState();
}

class _ReusableContainerDarkState extends State<ReusableContainerDark> {
  var _isDark = false;

  @override
  void didChangeDependencies() {
    setState(() {
      //     _isDark = mode;
    });
    //   modePreference();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _isDark = Provider.of<ModePreferencesProvider>(context).mode;
    return Container(
      decoration: (_isDark)
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/gifs/night_bg.gif',
                ),
                fit: BoxFit.cover,
              ),
            )
          : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ],
              ),
            ),
      child: widget.child,
    );
  }
}
