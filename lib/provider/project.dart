import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Project with ChangeNotifier {
  String id;
  String title;
  String shortDescription;
  String longDescription1;
  String longDescription2;
  Map<String, dynamic> progressData;
  // dynamic totalDonation;
  // dynamic currentDonation;
  int totalDonation;
  int currentDonation;
  List<String> members;

  Project({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.longDescription1,
    required this.longDescription2,
    required this.progressData,
    required this.totalDonation,
    required this.currentDonation,
    required this.members,
  });
}

class AllProjects with ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects {
    return _projects;
  }

  Future<void> fetchAndSetupProjects() async {
    await FirebaseFirestore.instance
        .collection('projects')
        .snapshots()
        .listen((allProjects) {
      print('This is what you wanted to print:');
      List<Project> loadedProjects = [];
      // print(allProjects);
      allProjects.docs.forEach((eachProject) {
        print(eachProject['title']);
        // print(eachProject['currentDonation']);
        // print(eachProject['progressData']['Digital Schools']);
        // print(eachProject['members']);

        // Project projectItem = Project(
        //   id: eachProject.id,
        //   title: eachProject['title'],
        //   shortDescription: eachProject['shortDescription'],
        //   longDescription1: eachProject['longDescription1'],
        //   longDescription2: eachProject['longDescription2'],
        //   progressData: eachProject['progressData'],
        //   totalDonation: eachProject['totalDonation'],
        //   currentDonation: eachProject['currentDonation'],
        //   // totalDonation: int.parse(eachProject['totalDonation']),
        //   // currentDonation: int.parse(eachProject['currentDonation']),
        //   members: eachProject['members'],
        // );
        // _projects.add(projectItem);

        // List<String> fetchedMembers = [];
        // eachProject['members'];

        List<dynamic> tempMembersList = eachProject['members'];
        List<String> membersList = [];
        tempMembersList.forEach((memberId) {
          membersList.add(memberId.toString());
        });

        loadedProjects.add(Project(
          id: eachProject.id,
          title: eachProject['title'],
          shortDescription: eachProject['shortDescription'],
          longDescription1: eachProject['longDescription1'],
          longDescription2: eachProject['longDescription2'],
          progressData: eachProject['progressData'],
          totalDonation: eachProject['totalDonation'],
          currentDonation: eachProject['currentDonation'],
          // totalDonation: int.parse(eachProject['totalDonation']),
          // currentDonation: int.parse(eachProject['currentDonation']),
          // members: eachProject['members'],
          members: membersList,
        ));

        print(eachProject['progressData']);
      });
      print(loadedProjects.length);
      _projects = loadedProjects;
      print(_projects.length);
    });
  }
}
