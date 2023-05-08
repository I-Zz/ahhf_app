import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminFeed with ChangeNotifier {
  String? _adminId;
  String? _title;
  String? _datetime;
  // String? _userFirstName;
  // String? _userLastName;
  String? _description;
  // Uri? _userImageUrl;
  String? _feedimageurl;
  String? _projectID;
  String? _likes;
  // DateTime? _dateOfBirth;

  // Future<bool> userExists(User? user) async {
  //   var querySnapshot =
  //       await FirebaseFirestore.instance.collection('users').get();

  //   var fetchedUsersData = querySnapshot.docs;

  //   bool flag = false;
  //   for (var fetchedUser in fetchedUsersData) {
  //     print('loop running...');
  //     if (fetchedUser.id == user!.uid) {
  //       flag = true;
  //       print('flag is true now');
  //       continue;
  //     }
  //   }
  //   print('returning flag');

  //   return flag;
  // }

  Future<void> setFeedData(AdminFeed? adminFeed) async {
    print('fetching feed  data ...');
    if (adminFeed!._adminId == null) return;
    // if(user.displayName == null) return;

    var querySnapshot =
        await FirebaseFirestore.instance.collection('feedadmin').get();

    var fetchedFeedData = querySnapshot.docs;

    var flag = true;
    for (var fetchedFeed in fetchedFeedData) {
      print('searching for already existing feed ... ');
      if (fetchedFeed.id == adminFeed._adminId) {
        _adminId = fetchedFeed.id;
        _title = fetchedFeed['title'];
        _datetime = fetchedFeed['datetime'];
        _description = fetchedFeed['description'];
        _feedimageurl = fetchedFeed['feedimageUrl'];
        _projectID = fetchedFeed['projectID'];
        _likes = fetchedFeed['likes'];

        flag = false;
        //print('found the existing user ... ');
      }
    }
    if (flag) {
      Map<String, dynamic> feedData = {
        'title': adminFeed._title,
        'datetime': adminFeed._datetime,
        'description': adminFeed._description,
        'feedimageurl': adminFeed._feedimageurl,
        //'projectID': admin._projectID,
        'likes': adminFeed._likes,
      };
      print('sending feed data to firebase firestore ... ');
      await FirebaseFirestore.instance
          .collection('admin')
          .doc(adminFeed._adminId)
          .set(feedData);

      _adminId = adminFeed._adminId;
      _title = adminFeed._title;
      _datetime = adminFeed._datetime;
      _description = adminFeed._description;
      _feedimageurl = adminFeed._feedimageurl;
      //_projectID = admin._projectID;
      _likes = adminFeed._likes;
      //_eventimageurl = admin._eventimageurl;

      print('setted feed data, done.');
    }

    // _userId = user.uid;
    // _userName = user.displayName;
    // _userEmail = user.email;
    // _userImageUrl = Uri.parse(user.photoURL as String);
    // _userImageUrl = user.photoURL;

    // print(user.uid);
    // print(_userEmail);
    // print(_userImageUrl);
    // print(_bloodGroup);
    // print(_address);
    // print(_dateOfBirth);

    // After this call the firebase using the userId
    // and find if this user's data is in the database
    // if it exists then fetch the other data like address, dob etc.
    // if it doesn't exist then put the data in the database
  }

  void addfeedData(Map<String, dynamic> adminData, String? adminId) async {
    //print(adminData['address']);
    await FirebaseFirestore.instance.collection('feedadmin').add(adminData);
    // .doc(adminId)
    // .set(adminData);
  }

  // String? getUserName() {
  //   return _;
  // }

  Map<String, String?> get getAdminFeedData {
    return {
      'id': _adminId,
      'title': _title,
      'datetime': _datetime,
      'description': _description,
      'feedimageurl': _feedimageurl,
      'projectID': _projectID,
      'likes': _likes,

      // 'address': _address,
      // 'bloodGroup': _bloodGroup,
      // 'dob': _dateOfBirth,
    };
  }

  Map<String, String?> get getCompleteFeedData {
    print('personal Details: $_title');
    print('personal Details: $_datetime');

    print('personal Details: $_description');
    print('personal Details: $_feedimageurl');
    //print('personal Details: $_projectID');
    print('personal Details: $_likes');
    //print('personal Details: $_address');
    return {
      'id': _adminId,
      'title': _title,
      'datetime': _datetime,
      'description': _description,
      'imageUrl': _feedimageurl,
      'projectID': _projectID,
      'likes': _likes,
    };
  }
}
