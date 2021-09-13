import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:saymine/screens/main_home_screen.dart';

import '../main.dart';

class LoginController extends GetxController {
  loginWithEmailPass(userName, password) async {
    await auth
        .signInWithEmailAndPassword(
          email: userName,
          password: password,
        )
        .whenComplete(
          () => print("user login done"),
        )
        .catchError((error) {
      if (error is FirebaseAuthException) {
        // error(error.code);
        print("hvhjvhvhvh");
      }
    });
    navigatorKey.currentState!.pushReplacementNamed(MainHomeScreen.routeName);
    // print(auth.currentUser);
  }


}
