import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // AppBar(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0.0,
              //   leading: CircleAvatar(
              //     child: Image.network(
              //       'https://newevolutiondesigns.com/images/freebies/cool-wallpaper-1.jpg',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   title: Text('Name Here!'),
              //   // automaticallyImplyLeading: false,
              // ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://newevolutiondesigns.com/images/freebies/cool-wallpaper-1.jpg',
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
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: FadeInImage(
                            fit: BoxFit.fill,
                            width: 200,
                            height: 200,
                            placeholder: AssetImage("assets/gifs/loading.gif"),
                            image: NetworkImage(
                                'https://newevolutiondesigns.com/images/freebies/cool-wallpaper-1.jpg'),
                          ),
                        ),
                        // child: Container(
                        //   width: 200,
                        //   height: 200,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //         image: NetworkImage(
                        //             'https://newevolutiondesigns.com/images/freebies/cool-wallpaper-1.jpg'),
                        //         fit: BoxFit.fitWidth),
                        //   ),
                        // ),
                        // child: CircleAvatar(
                        //   maxRadius: 50,
                        //   minRadius: 20,
                        //   backgroundImage: NetworkImage(
                        //     'https://newevolutiondesigns.com/images/freebies/cool-wallpaper-1.jpg',
                        //   ),
                        //   // fit: BoxFit.cover,
                        // ),
                      ),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            'Anna Muthu Swami',
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
