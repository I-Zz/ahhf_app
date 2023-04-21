import 'package:ahhf_app/provider/feedProvider.dart';
import 'package:ahhf_app/widgets/FeedTab.dart';
import 'package:flutter/material.dart';
import 'package:ahhf_app/widgets/app_bar_common.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import './homepageeventsscreen.dart';
import 'package:ahhf_app/provider/ProjectDetailsEvent_provider.dart';

class HomePageTabsScreen extends StatefulWidget {
  static const String id = 'ProjectsDetailScreen';

  @override
  State<HomePageTabsScreen> createState() => _HomePageTabsScreenState();
}

class _HomePageTabsScreenState extends State<HomePageTabsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBarCommon('Anand'),
      body: Column(
        children: [
          Container(
            color: Color.fromRGBO(255, 255, 255, 1),
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
          ))
        ],
      ),
    );
  }
}
