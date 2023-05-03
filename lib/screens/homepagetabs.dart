import 'package:ahhf_app/provider/feedProvider.dart';
import 'package:ahhf_app/provider/userAuth.dart';
import 'package:ahhf_app/widgets/FeedTab.dart';
import 'package:flutter/material.dart';
import 'package:ahhf_app/widgets/app_bar_common.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import './homepageeventsscreen.dart';

class HomePageTabsScreen extends StatefulWidget {
  static const String id = 'ProjectsDetailScreen';

  @override
  State<HomePageTabsScreen> createState() => _HomePageTabsScreenState();
}

class _HomePageTabsScreenState extends State<HomePageTabsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var userName = Provider.of<CurrentUser>(context).getUserName();
    TabController _tabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBarCommon(userName, true),
      body: Column(
        children: [
          Container(
            // height: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  blurRadius: 20,
                  spreadRadius: 20,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabcontroller,
              isScrollable: false,
              labelColor: Color(0xFF428FD4),
              unselectedLabelColor: Color.fromRGBO(130, 130, 130, 50),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 25),
              tabs: [
                Tab(
                  child: Text('Feed'),
                ),
                Tab(
                  child: Text(
                    'Events',
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabcontroller,
              children: [
                feedTab(),
                HomePageEventScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
