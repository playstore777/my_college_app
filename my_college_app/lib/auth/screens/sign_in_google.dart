import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/custom_exceptions/unregistered_email_exception.dart';

class SignInGoogle extends StatelessWidget {
  Future<UserCredential> _signInWithGoogle(context) async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();
    print('googleUser : $googleUser');
    print('googleUser email : ${googleUser.email}');
    if (!(googleUser.email).contains('@josephscollege')) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Not Authorized'),
          content: Text('Please use College Email address'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            ),
          ],
        ),
      );
      GoogleSignIn().signOut();
      throw UnregisteredEmailException('Unregistered Email');
    } else {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print('googleAuth : $googleAuth');
      print('googleAuth type : ${googleAuth.runtimeType}');

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print('credential : $credential');
      print('credential Type : ${credential.runtimeType}');
      print('Signned In, YAAAAAY!');
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  // Future<void> _handleSignIn() async {
  //   final googleUser = await GoogleSignIn().signIn();
  //   print('googleUser : $googleUser');
  //   print('googleUser email : ${googleUser.email}');
  //   if (!(googleUser.email).contains('@josephscollege')) {
  //     GoogleSignIn().signOut();
  //     throw UnregisteredEmailException('Unregistered Email');
  //   }
  //   print('Signned In, YAAAAAY!');
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // try {
        _signInWithGoogle(context);
        // _handleSignIn();
        // } on UnregisteredEmailException catch (e) {
        //   print(e.toString());
        //   return showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //       title: Text('Error in siging in!'),
        //       content: Text(e.toString()),
        //     ),
        //   );
        // }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        width: 250,
        height: 80,
        alignment: Alignment.center,
        child: Text(
          'Google Sign In',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
