import 'package:flutter/material.dart';

class ProjectDetailsEventTabItems  with ChangeNotifier{
  final String image;
  final String title;
  final String EventAddress;
  final DateTime EventDate;
  final TimeOfDay EventTime;

  ProjectDetailsEventTabItems(
      {required this.EventAddress,
      required this.EventDate,
      required this.EventTime,
      required this.image,
      required this.title});


}

class ProjectDetailsEventTabProvider with ChangeNotifier {
 // for I have mark ProjectDetailsEventTabProvider widget in ProjectDetailsEvent_provider file with
  // changeNotifier

  List<ProjectDetailsEventTabItems> _items = [
    ProjectDetailsEventTabItems(
        EventAddress: '321, Vasantbaug Society, Pune, PCMC',
        title: 'School kit distribution ',
        EventDate: DateTime(2023, 2, 15),
        EventTime: TimeOfDay(hour: 21, minute: 30),
        image: 'assets/images/EventTab1.png'),

    ProjectDetailsEventTabItems(
        EventAddress: '321, Vasantbaug Society, Pune, PCMC',
        title: 'School kit distribution ',
        EventDate: DateTime(2023, 2, 15),
        EventTime: TimeOfDay(hour: 24, minute: 00),
        image: 'assets/images/EventTab2.png'),


  ];


  List<ProjectDetailsEventTabItems> get items{
    return [..._items];
  }

  void addEventTabItems(){

    notifyListeners();
  }

}
