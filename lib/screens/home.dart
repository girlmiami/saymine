import 'package:flutter/material.dart';
import 'package:saymine/screens/login_screen.dart';
import 'package:saymine/screens/main_home_screen.dart';

import '../main.dart';


// App Main Page showing the no of comapnies that are holding data
// also show reclaiming progress on a Radial Circular Chart


class MyHomePage extends StatefulWidget {
  static const routeName = "/homePage";

  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Streaming the Firebase auth instance on main.dart
    // if the auth is null we take them loginScreen

    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return MainHomeScreen(
            title: widget.title,
          );
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
