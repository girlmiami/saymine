import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saymine/widgets/radial_gauge.dart';

class DataOwnershipProgress extends StatefulWidget {
  @override
  _DataOwnershipProgressState createState() => _DataOwnershipProgressState();
}

class _DataOwnershipProgressState extends State<DataOwnershipProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 450.w,
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadialGaugeWidget(
            title: "Your data ownership progress",
            value: 50.0,
          ),
        ),
      ),
    );
  }
}
