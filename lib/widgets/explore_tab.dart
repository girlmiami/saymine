import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saymine/models/single_company_detail.dart';
import 'package:saymine/widgets/single_company_widget.dart';

class ExploreTab extends StatefulWidget {
  final height;
  final width;

  const ExploreTab({Key? key, this.height, this.width}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  List companyList = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0.h,
                    bottom: 8.0.h,
                    left: 8.0.h,
                  ),
                  child: Text(
                    "New in your footprint",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.h,
                      fontFamily: "IBM",
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Emails")
                  .where("joinedDate", isGreaterThan: DateTime.now().subtract(Duration(days: 30),),)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<SingleCompanyDetails> companies = [];
                  snapshot.data.docs.forEach(
                    (element) {
                      companies.add(
                        SingleCompanyDetails.fromJson(
                          element.data(),
                        ),
                      );
                    },
                  );
                  return Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    height: 300.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        return SingleCompanyWidget(
                          companyDetails: companies[index],
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0.h,
                    bottom: 8.0.h,
                    left: 8.0.h,
                  ),
                  child: Text(
                    "Social companies holding your data",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.h,
                      fontFamily: "IBM",
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Emails")
                  .where("industry", isEqualTo: "Social & Community")
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<SingleCompanyDetails> companies = [];
                  snapshot.data.docs.forEach(
                    (element) {
                      companies.add(
                        SingleCompanyDetails.fromJson(
                          element.data(),
                        ),
                      );
                    },
                  );
                  return Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    height: 300.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        return SingleCompanyWidget(
                          companyDetails: companies[index],
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0.h,
                    bottom: 8.0.h,
                    left: 8.0.h,
                  ),
                  child: Text(
                    "Media companies holding your data",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.h,
                      fontFamily: "IBM",
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Emails")
                  .where("industry", isEqualTo: "Media & Entertainment")
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<SingleCompanyDetails> companies = [];
                  snapshot.data.docs.forEach(
                    (element) {
                      companies.add(
                        SingleCompanyDetails.fromJson(
                          element.data(),
                        ),
                      );
                    },
                  );
                  return Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    height: 300.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        return SingleCompanyWidget(
                          companyDetails: companies[index],
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
