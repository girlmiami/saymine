import 'package:flutter/material.dart';
import 'package:saymine/screens/all_companies.dart';
import 'package:saymine/screens/email_verification_waiting_screen.dart';
import 'package:saymine/screens/home.dart';
import 'package:saymine/screens/login_screen.dart';
import 'package:saymine/screens/main_home_screen.dart';
import 'package:saymine/screens/my_footprints.dart';
import 'package:saymine/screens/user_signup_screen.dart';


// All the routes (SCREENS) in the app
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AllCompaniesPage.routeName:
      return MaterialPageRoute(
        builder: (context) => AllCompaniesPage(),
        settings: settings,
      );
    case EmailVerificationWaitingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => EmailVerificationWaitingScreen(),
        settings: settings,
      );
    case MyHomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => MyHomePage(
          title: 'Vumonic Datalabs',
        ),
        settings: settings,
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
        settings: settings,
      );
    case MyFootPrints.routeName:
      return MaterialPageRoute(
        builder: (context) => MyFootPrints(),
        settings: settings,
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => SignUpScreen(),
        settings: settings,
      );
    case MainHomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => MainHomeScreen(title: "Vumonic Datalabs",),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text("No Routes")),
        ),
      );
  }
}
