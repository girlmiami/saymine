import 'package:flutter/material.dart';
import 'package:saymine/main.dart';
import 'package:saymine/widgets/companies_holding_data.dart';
import 'package:saymine/widgets/data_ownership_progress.dart';
import 'package:saymine/widgets/main_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHomeScreen extends StatefulWidget {
  static const routeName = "/mainHomeScreen";
  final title;

  const MainHomeScreen({Key? key, this.title}) : super(key: key);

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Drawer(),
      appBar: MainAppBar(
        title: widget.title,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 500.h,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  child: Text(
                    "Welcome ! ${auth.currentUser!.email}",
                    style: TextStyle(
                      fontSize: 30.h,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CompaniesHoldingData(),
              DataOwnershipProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
