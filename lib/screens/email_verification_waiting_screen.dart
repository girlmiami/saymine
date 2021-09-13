import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';


// Wait for firebase to confirm email verification sent to users email
// by creating a scheduled timer of 5 seconds

class EmailVerificationWaitingScreen extends StatefulWidget {
  static const routeName = "/emailVerificationScreen";

  @override
  _EmailVerificationWaitingScreenState createState() =>
      _EmailVerificationWaitingScreenState();
}

class _EmailVerificationWaitingScreenState
    extends State<EmailVerificationWaitingScreen> {
  User? user;
  late Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    print("send mail");
    user!.sendEmailVerification();

    Timer.periodic(Duration(seconds: 1), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "An Email has been sent to ${user!.email} please verify. \n Don't Press Back Button",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    print("reload");
    await user!.reload();

    if (user!.emailVerified) {
      // navigatorKey.currentState.pushNamed(AllRestaurantsScreen.routeName);
      timer.cancel();
    }
  }
}
