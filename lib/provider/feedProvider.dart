import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedModel with ChangeNotifier {
  final String imageUrl;
  final String id;
  final String description;
  final String dateTime;
  final String projectID;
  bool likes;

  final int totalLikes;
  FeedModel({
    required this.description,
    required this.dateTime,
    required this.id,
    required this.projectID,
    required this.imageUrl,
    this.likes = false,

    required this.totalLikes,
  });
}

class FeedTabProvider with ChangeNotifier {
  // for I have mark ProjectDetailsEventTabProvider widget in ProjectDetailsEvent_provider file with
  // changeNotifier

  List<FeedModel> _feeds = [

  ];

  List<FeedModel> get feeds {
    return [..._feeds];
  }

  Future<void> fetchAndSetupFeeds() async {
    await FirebaseFirestore.instance
        .collection('feeds')
        .snapshots()
        .listen((feeds) {
      List<FeedModel> loadedFeeds = [];

      feeds.docs.forEach((eachfeed) {
        print('adding feed items');
        loadedFeeds.add(FeedModel(
          id: eachfeed.id,
            description: eachfeed['description'],
            dateTime: eachfeed['dateTime'],
            projectID: eachfeed['projectID'],
            imageUrl: eachfeed['imageUrl'],
            totalLikes: eachfeed['totalLikes']));
      });
      print('${loadedFeeds.length} thsil ');
      _feeds=loadedFeeds;
      print('${_feeds.length} this feed length');
    });


  }
}


