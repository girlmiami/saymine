import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:saymine/models/end_user.dart';
import 'package:saymine/screens/main_home_screen.dart';

import '../main.dart';

class AuthController extends GetxController {
  // Firebase Authentication Instance of user that is being streamed
  FirebaseAuth auth = FirebaseAuth.instance;
  final endUser = EndUser(userId: "", email: "").obs;

  loginWithEmailPass(userName, password) async {
    UserCredential userCredential = await auth
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

    endUser.update((user) {
      user!.email = userCredential.user!.email!;
      user.userId = userCredential.user!.uid;
      // user!.userId = userCredential.user!.uid!;
    });
    navigatorKey.currentState!.pushReplacementNamed(MainHomeScreen.routeName);
    // print(auth.currentUser);
  }
}
