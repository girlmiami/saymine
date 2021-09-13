import 'package:flutter/material.dart';
import 'package:saymine/widgets/explore_tab.dart';
import 'package:saymine/widgets/main_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// This is the page where user are able to see all the companies
// that are holding user data on two different TABS
// EXPLORE => See Companies classified by subject titles & industry they belong to
// See All => All companies in Gridview manner
// Filters => Filter Companies Manually

class AllCompaniesPage extends StatefulWidget {
  static const routeName = "/allCompaniesPage";
  @override
  _AllCompaniesPageState createState() => _AllCompaniesPageState();
}

class _AllCompaniesPageState extends State<AllCompaniesPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Drawer(),
      appBar: MainAppBar(
        title: "Vumonic datalabs",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).backgroundColor,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 500.h,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    "Where's Your Data?",
                    style: TextStyle(
                      fontSize: 55.h,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    top: 20,
                    right: 50.h,
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          "Explore",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.h),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "See all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.h),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.filter_alt_outlined,
                        ),
                      ),
                    ],
                    unselectedLabelColor: Theme.of(context).accentColor,
                    labelColor: Theme.of(context).primaryColor,
                    indicatorColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Container(
                height: 750.h,
                width: 500.h,
                // decoration: BoxDecoration(
                //   border: Border.all(),
                // ),
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    Center(
                      child: ExploreTab(),
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
