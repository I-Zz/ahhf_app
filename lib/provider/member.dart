import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Member with ChangeNotifier {
  String id;
  String name;
  String imageUrl;

  Member({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

//class AllMembers with ChangeNotifier {
  // List<Member> _members = [];
  //
  // List<Member> get members{
  //   return [..._members];
  // }
  //
  //
  //
  //
  // Future<void> fetchAndSetupMembers() async {
  //   List<Member> loadedMembers = [];
  //
  //   await FirebaseFirestore.instance
  //       .collection('members')
  //       .snapshots()
  //       .listen((allMembers) {
  //     allMembers.docs.forEach((eachMember) {
  //       loadedMembers.add(Member(
  //         id: eachMember.id,
  //         name: eachMember['name'],
  //         imageUrl: eachMember['memberImageUrl'],
  //       ));
  //     });
  //     _members = loadedMembers;
  //   });
  // }
//}
