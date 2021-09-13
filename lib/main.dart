import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saymine/router.dart';
import 'package:saymine/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

// navigator key to be used when no context is present
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
// Firebase Authentication Instance of user that is being streamed
FirebaseAuth auth = FirebaseAuth.instance;

Future<void> main() async {
  // the WidgetFlutterBinding is used to interact with the Flutter engine
  // to make sure that you have an instance of the WidgetsBinding.
  WidgetsFlutterBinding.ensureInitialized();
  // call native code to initialize Firebase
  await Firebase.initializeApp();
  //make MyApp() the root of the widget tree
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Give initial height and width to screenutil initialization to make UI RESPONSIVE
    return ScreenUtilInit(
      designSize: Size(
        490.9,
        1036.4,
      ),
      builder: () {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            primaryColor: Color(0xff7551f6),
            backgroundColor: Colors.white,
            selectedRowColor: Colors.black,
            accentColor: Colors.grey,
            fontFamily: "Crimson",
          ),
          navigatorKey: navigatorKey,
          // whenever navigatorkey is called for navigation, generate route is called
          onGenerateRoute: generateRoute,
          home: MyHomePage(
            title: 'Vumonic Datalabs',
          ),
        );
      },
    );
  }
}
