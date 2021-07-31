import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';
import '../resuable_ui/reusable_container.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  final User user = FirebaseAuth.instance.currentUser;
  // AnimateIconController _animationController;

  // @override
  // void initState() {
  // _animationController = AnimationController(
  //   duration: Duration(milliseconds: 300),
  //   vsync: this,
  // );
  // _animationController = AnimateIconController();
  //   super.initState();
  // }

  // Future<void> saveModePreferences() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('_isDark', _isDark);
  // }

  bool modeChanger() {
    setState(() {
      _isDark = !_isDark;
    });
    Provider.of<DataProvider>(context, listen: false).changeMode();
    return _isDark;
  }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  var _isDark = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ReusableContainerDark(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: (user.photoURL == null)
                            ? AssetImage("assets/gifs/man_wearing_jackets.gif")
                            : NetworkImage(
                                user.photoURL,
                              ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(0.2),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    width: size.width,
                    height: size.height * 0.4,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: FadeInImage(
                                fit: BoxFit.fill,
                                width: size.width * 0.6,
                                height: size.height * 0.3,
                                placeholder: AssetImage(
                                    "assets/gifs/man_wearing_jackets.gif"),
                                image: (user.photoURL == null)
                                    ? AssetImage(
                                        "assets/gifs/man_wearing_jackets.gif")
                                    : NetworkImage(
                                        user.photoURL,
                                      ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FittedBox(
                              child: Text(
                                user.displayName,
                                // 'Loading',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Positioned(
                  //   right: 5,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.grey.withOpacity(0.5),
                  //     ),
                  //     child: AnimateIcons(
                  //       startIcon: Icons.ac_unit,
                  //       startTooltip: 'Light Mode',
                  //       endIcon: Icons.nightlight_round,
                  //       endTooltip: 'Dark Mode',
                  //       controller: _animationController,
                  //       onStartIconPress: modeChanger,
                  //       onEndIconPress: modeChanger,
                  //       startIconColor: Colors.black,
                  //       endIconColor: Colors.white,
                  //       duration: Duration(milliseconds: 300),
                  //     ),
                  //   ),
                  // ),
                  // IconButton(
                  //   icon: AnimatedIcon(
                  //     icon: AnimatedIcons.add_event,
                  //     progress: _animationController,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _isDark = !_isDark;
                  //       (_isDark)
                  //           ? _animationController.forward()
                  //           : _animationController.reverse();
                  //     });
                  //   },
                  // ),
                ],
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: FittedBox(
                        child: Text(
                          (_isDark) ? 'Dark Mode' : 'Light Mode',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Switch(
                      value: _isDark,
                      activeColor: Colors.white,
                      onChanged: (value) => modeChanger(),
                    )
                  ],
                ),
              ),
              // Divider(
              //   color: Colors.white,
              // ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (ctx) => AuthScreen(),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
