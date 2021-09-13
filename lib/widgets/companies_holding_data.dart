import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saymine/screens/all_companies.dart';

class CompaniesHoldingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 500.h,
        width: 450.w,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/bulb_eye.png",
                height: 200.h,
                width: 300.h,
                fit: BoxFit.cover,
              ),
              Text(
                "20",
                style: TextStyle(
                  color: Theme.of(context).selectedRowColor,
                  fontSize: 50.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "companies holding your data were \n found in your footprint",
                  style: TextStyle(
                    color: Theme.of(context).selectedRowColor,
                    fontSize: 25.h,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  onPressed(context);
                },
                child: Container(
                  height: 50.h,
                  width: 250.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.0.h,
                        right: 15.0.h,
                        top: 8.0.h,
                        bottom: 8.0.h,
                      ),
                      child: Text(
                        "See what companies",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AllCompaniesPage(),
      ),
    );
  }
}
