import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saymine/models/single_company_detail.dart';



// This widget is the card that shows user, the company cards where they
// can see more insights into the data that it is holding

class SingleCompanyWidget extends StatefulWidget {
  final SingleCompanyDetails companyDetails;

  const SingleCompanyWidget({Key? key, required this.companyDetails})
      : super(key: key);

  @override
  _SingleCompanyWidgetState createState() => _SingleCompanyWidgetState();
}

class _SingleCompanyWidgetState extends State<SingleCompanyWidget> {
  // boolean to show options when true (on tap)
  bool showOption = false;

  // list of month names
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, stateOfWidget) {
        return GestureDetector(
          onTap: () {
            // print("tapped");
            stateOfWidget(() {
              showOption = !showOption;
            });
            // print(showOption);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              width: 230.h,
              child: Material(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                elevation: 1,
                child: GridTile(
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/building.png",),
                      child: Image.network(
                        "https://auro-invest.s3-us-west-2.amazonaws.com/APPLE INC.jpg",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Text('😢');
                        },
                        // loadingBuilder: (BuildContext context, Widget child,
                        //     ImageChunkEvent? loadingProgress) {
                        //   if (loadingProgress == null) {
                        //     return child;
                        //   }
                        //   return Center(
                        //     child: Image.asset(
                        //       "assets/building.png",
                        //     ),
                        //   );
                        // },
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "${widget.companyDetails.companyName}",
                            style: TextStyle(
                              color: Theme.of(context).selectedRowColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.h,
                            ),
                          ),
                        ),
                        showOptionWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  showOptionWidget() {
    return showOption
        ? Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: 120.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  child: Center(
                    child: Text(
                      "Reclaim",
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "IBM",
                        fontSize: 20.h,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    "See More",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.h,
                      fontFamily: "IBM",
                    ),
                  ),
                ),
              ),
            ],
          )
        : showDateWidget();
  }

  showDateWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            "${widget.companyDetails.industry}",
            style: TextStyle(
              color: Theme.of(context).selectedRowColor,
              fontWeight: FontWeight.w500,
              fontSize: 15.h,
              fontFamily: "IBM",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            "Joined on ${months[widget.companyDetails.joinedDate!.month]},${widget.companyDetails.joinedDate!.year}",
            style: TextStyle(
              color: Theme.of(context).selectedRowColor,
              fontWeight: FontWeight.w300,
              fontSize: 12.h,
              fontFamily: "IBM",
            ),
          ),
        ),
        Divider(
          endIndent: 20.h,
          indent: 20.h,
          thickness: 1.5,
        ),
      ],
    );
  }
}
