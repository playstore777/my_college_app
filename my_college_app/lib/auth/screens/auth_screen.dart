import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:my_college_app/screens/home_screen.dart';
import 'sign_in_google.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLoading = false;
  var _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _credentials = {
    'Email': '',
    'Password': '',
  };

  void _onSubmit() async {
    final _validation = _formKey.currentState.validate();
    if (!_validation) {
      return;
    }
    print('_onSubmit _validation : $_validation');
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final _auth = FirebaseAuth.instance;
      await _auth.signInWithEmailAndPassword(
        email: _credentials['Email'],
        password: _credentials['Password'],
      );
      setState(() {
        _isLoading = false;
      });

      // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (error) {
      print('error in _onSubmit: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://1.bp.blogspot.com/-pKgeORCJlVM/Xrzy6k3_b-I/AAAAAAAAD-I/Z371vVGNKzAfkSSHxOMGBbNDoK-YLFgBQCLcBGAsYHQ/s1600/logo-new-big.jpg',
                          ),
                        ),
                        radius: 50,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: Colors.white70,
                          ),
                          hintText: 'No spaces/tabs are allowed',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@'))
                            return 'please enter a valid Email Address';
                          return null;
                        },
                        onSaved: (value) {
                          if (value.isEmpty) return;
                          setState(() {
                            _credentials['Email'] = value.trim();
                          });
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      if (_isLogin)
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          validator: (value) {
                            if (value.length < 7) {
                              return 'password cannot be less than 7 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value.isEmpty) return;
                            setState(() {
                              _credentials['Password'] = value.trim();
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'No spaces/tabs are allowed',
                            hintStyle: TextStyle(
                              color: Colors.white70,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white70,
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      SizedBox(
                        height: 25,
                      ),
                      (_isLoading)
                          ? Center(
                              child: Image(
                              image: AssetImage("assets/gifs/loading1.gif"),
                            )
                              // CircularProgressIndicator(),
                              )
                          : ElevatedButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor,
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).accentColor,
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                    Colors.white,
                                  )),
                              onPressed: (_isLogin)
                                  ? _onSubmit
                                  : () {
                                      // GoogleSignIn().currentUser.authentication.
                                    },
                              child: Text((_isLogin) ? 'Login' : 'Submit'),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      // TextButton(
                      //   style: ButtonStyle(
                      //     foregroundColor: MaterialStateProperty.all(
                      //       Colors.white,
                      //     ),
                      //     overlayColor: MaterialStateProperty.all(
                      //       Colors.teal,
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       _isLogin = !_isLogin;
                      //     });
                      //   },
                      //   child: Text(
                      //       (_isLogin) ? 'Forgot password' : 'Instead Login'),
                      // ),
                      SignInGoogle(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
