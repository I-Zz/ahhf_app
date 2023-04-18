import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<bool> userExists(User? user) async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    var fetchedUsersData = querySnapshot.docs;

    bool flag = false;
    fetchedUsersData.forEach((fetchedUser) {
      if (fetchedUser.id == user!.uid) {
        flag = true;
        return;
      }
    });

    return flag;
  }

  void setInitialUserData(User? user) async {
    if (user!.uid == null) return;

    var querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    var fetchedUsersData = querySnapshot.docs;

    var flag = true;
    fetchedUsersData.forEach((fetchedUser) {
      if (fetchedUser.id == user.uid) {
        _userId = fetchedUser.id;
        _userName = fetchedUser['name'];
        _userEmail = fetchedUser['email'];
        _userImageUrl = fetchedUser['imageUrl'];
        _bloodGroup = fetchedUser['bloodGroup'];
        _address = fetchedUser['address'];
        flag = false;
      }
    });
    if (flag) {
      Map<String, dynamic> userData = {
        'name': 'John Doe',
        'email': 'abc@abc.com',
        'imageUrl':
            'https://icon-library.com/images/person-image-icon/person-image-icon-25.jpg',
        'bloodGroup': 'O+',
        'address': 'Pune, Maharashtra, India',
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userData);
    }

    if (user == null) {
      _userName = 'Anand B';
      _userEmail = 'anand@gmail.com';
      return;
    }
    // _userId = user.uid;
    // _userName = user.displayName;
    // _userEmail = user.email;
    // _userImageUrl = Uri.parse(user.photoURL as String);
    _userImageUrl = user.photoURL;

    print(user.uid);
    print(_userEmail);
    print(_userImageUrl);
    print(_bloodGroup);
    print(_address);

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
