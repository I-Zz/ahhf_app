// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ahhf_app/provider/project.dart';
import 'package:ahhf_app/provider/ProjectDetailsEvent_provider.dart';
import 'package:ahhf_app/widgets/projectDetailsOverviewTab.dart';
import 'package:ahhf_app/widgets/projectDetailsEventTab.dart';
import 'package:ahhf_app/widgets/projectDetailsFeedTab.dart';
import 'package:ahhf_app/widgets/projectDetailsMembersTab.dart';

//put the cards in the gesturedetector

class ProjectsDetailScreen extends StatefulWidget {
  static const String id = 'ProjectsDetailScreen';
  final String projectID;
  final AllProjects allProjects;
  ProjectsDetailScreen({required this.projectID,required this.allProjects});

  @override
  State<ProjectsDetailScreen> createState() => _ProjectsDetailScreenState();
}

class _ProjectsDetailScreenState extends State<ProjectsDetailScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    TabController _tabcontroller = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 15,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Project Details',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Colors.black),
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: ProjectDetailsEventTabProvider(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/project_details_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: TabBar(
                controller: _tabcontroller,
                isScrollable: true,
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
                    child: Text('OVERVIEW'),
                  ),
                  Tab(
                    child: Text('FEED'),
                  ),
                  Tab(
                    child: Text('MEMBERS'),
                  ),
                  Tab(
                    child: Text(
                      'EVENTS',
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabcontroller,
              children: [
                projectDetailsOverviewTab(
                  projectID: widget.projectID,
                  allprojects: widget.allProjects,
                ),
                projectDetailsFeedTab(),
                projectDetailsMembersTab(projectID: widget.projectID,allProjects: widget.allProjects,),
                projectDetailsEventsTab(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
