import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser with ChangeNotifier {
  String? _userId;
  String? _userName;
  // String? _userFirstName;
  // String? _userLastName;
  String? _userEmail;
  // Uri? _userImageUrl;
  String? _userImageUrl;
  DateTime? _dateOfBirth;
  String? _bloodGroup;
  String? _address;

  void setInitialUserData(User? user) {
    if (user == null) {
      _userName = 'Anand B';
      _userEmail = 'anand@gmail.com';
      return;
    }
    _userId = user.uid;
    _userName = user.displayName;
    _userEmail = user.email;
    // _userImageUrl = Uri.parse(user.photoURL as String);
    _userImageUrl = user.photoURL;

    // After this call the firebase using the userId
    // and find if this user's data is in the database
    // if it exists then fetch the other data like address, dob etc.
    // if it doesn't exist then put the data in the database

  }

  Map<String, String?> get getProfileScreenUserData {
    return {
      'name': _userName,
      'email': _userEmail,
      'imageUrl': _userImageUrl,
    };
  }
}
