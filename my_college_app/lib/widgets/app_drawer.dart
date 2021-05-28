import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: CircleAvatar(
                child: Image.network(
                  'https://newevolutiondesigns.com/images/freebies/cool-wallpaper-1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Name Here!'),
              // automaticallyImplyLeading: false,
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (ctx) => AuthScreen(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
