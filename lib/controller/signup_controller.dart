import 'package:get/get.dart';
import 'package:saymine/screens/email_verification_waiting_screen.dart';

import '../main.dart';

class SignupController extends GetxController {
  signupWithEmailPass(email, pass) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    navigatorKey.currentState!
        .pushReplacementNamed(EmailVerificationWaitingScreen.routeName);
  }
}
