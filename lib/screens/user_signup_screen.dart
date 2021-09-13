import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saymine/controller/reusables.dart';
import 'package:saymine/controller/signup_controller.dart';
import 'package:saymine/screens/email_verification_waiting_screen.dart';
import 'package:saymine/widgets/tnc_text.dart';
import '../main.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "signup-screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();
  ReusableFunctionsWidgets _reusableFunctions = ReusableFunctionsWidgets();
  SignupController _signupController = Get.put(SignupController());

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              // border: Border.all(),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // IconButton(
                              //     icon: Icon(
                              //       Icons.arrow_back_ios,
                              //       color: Colors.black,
                              //     ),
                              //     onPressed: () {
                              //       Navigator.of(context).pop();
                              //     }),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 15),
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Column(
                      children: [
                        formWidget(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 32,
                                height: 60,
                                child: RaisedButton(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () async {
                                    await signUp();
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TermsAndConditionsText(),
                      ],
                    )
                  ],
                ),
                Positioned(
                  bottom: screenHeight / 10,
                  child: Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Have Account?  "),
                            GestureDetector(
                              onTap: () => navigatorKey.currentState!
                                  .pushReplacementNamed(LoginScreen.routeName),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  formWidget() {
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 5,
            ),
            child: Text(
              "Email Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              // decoration: BoxDecoration(border: Border.all()),
              height: 70,
              child: TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  // hintText: "Email",
                  helperText: "eg. Abhi123@gmail.com....",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                onFieldSubmitted: (_) {
                  if (_passwordFocusNode != null) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  }
                },
                validator: (value) {
                  if (!value!.contains("@")) {
                    return "Enter Valid Email";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 5,
            ),
            child: Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              height: 70,
              child: TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  helperText: "Atleast 8 Charaters",
                  // labelText: "Password",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return "Wrong Password";
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  error(value) {
    if (value == "invalid-email") {
      _reusableFunctions.showPopUpDialog("Invalid Email", context);
    } else if (value == "user-not-found") {
      _reusableFunctions.showPopUpDialog("User Not Found", context);
    } else if (value == "wrong-password") {
      _reusableFunctions.showPopUpDialog("Wrong Password", context);
    } else if (value == "email-already-in-use") {
      _reusableFunctions.showPopUpDialog("Email Already in Use", context);
    } else {
      _reusableFunctions.showPopUpDialog("Something went Wrong", context);
    }
  }

  Future<void> signUp() async {
    bool isValid = false;
    if (_form.currentState != null) {
      isValid = _form.currentState!.validate();
      _form.currentState!.save();
    }
    if (!isValid) {
      return;
    } else {
      try {
        // _signupController.signupWithEmailPass(
        //   _userNameController.text,
        //   _passwordController.text,
        // );
        await auth.signOut();
        print("user logout");
        await auth.createUserWithEmailAndPassword(
          email: _userNameController.text,
          password: _passwordController.text,
        );
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EmailVerificationWaitingScreen()),
        );
        // await _reusableFunctions.addNewUserToFirebase(auth.currentUser);
      } catch (loginError) {
        if (loginError is FirebaseAuthException) {
          error(loginError.code);
        }
      }
    }
  }
}
