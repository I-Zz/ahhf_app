import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProjects with ChangeNotifier {
  String? _adminId;
  String? _title;
  // String? _userFirstName;
  // String? _userLastName;
  String? _description;
  // Uri? _userImageUrl;
  String? _eventimageurl;
  String? projectID;

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

  Future<void> setEventData(AdminProjects? admin) async {
    print('fetching user data ...');
    if (admin!._adminId == null) return;
    // if(user.displayName == null) return;

    var querySnapshot =
        await FirebaseFirestore.instance.collection('admin').get();

    var fetchedEventsData = querySnapshot.docs;

    var flag = true;
    for (var fetchedEvents in fetchedEventsData) {
      print('searching for already existing user ... ');
      if (fetchedEvents.id == admin._adminId) {
        _adminId = fetchedEvents.id;
        _title = fetchedEvents['title'];
        _description = fetchedEvents['description'];
        _eventimageurl = fetchedEvents['eventimageUrl'];

        flag = false;
        //print('found the existing user ... ');
      }
    }
    if (flag) {
      Map<String, dynamic> eventData = {
        'title': admin._title,
        'description': admin._description,
        'eventimageurl': admin._eventimageurl,
      };
      print('sending events data to firebase firestore ... ');
      await FirebaseFirestore.instance
          .collection('admin')
          .doc(admin._adminId)
          .set(eventData);

      _adminId = admin._adminId;
      _title = admin._title;
      _description = admin._description;
      _eventimageurl = admin._eventimageurl;

      print('setted event data, done.');
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

  void addEventData(Map<String, dynamic> adminData, String? adminId) async {
    //print(adminData['address']);
    await FirebaseFirestore.instance.collection('admin').add(adminData);
    // .doc(adminId)
    // .set(adminData);
  }

  // String? getUserName() {
  //   return _;
  // }

  Map<String, String?> get getAdminEventsData {
    return {
      'id': _adminId,
      'title': _title,
      'description': _description,
      'imageUrl': _eventimageurl,
      // 'address': _address,
      // 'bloodGroup': _bloodGroup,
      // 'dob': _dateOfBirth,
    };
  }

  Map<String, String?> get getCompleteEventData {
    print('personal Details: $_title');
    print('personal Details: $_description');
    print('personal Details: $_eventimageurl');
    //print('personal Details: $_address');
    return {
      'id': _adminId,
      'title': _title,
      'description': _description,
      'imageUrl': _eventimageurl,
    };
  }
}
