import 'package:flutter/material.dart';
import '../data-models/project_screen_items.dart';

class Project_screen_provider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Project_screen_items> _items = [
    Project_screen_items(
      titletext: 'ARISE 2023',
      subtitletext:
          "AHHF's Rural Initiative for School Education. Join forces with us in being...",
      image: 'assets/images/project_screen_img1.png',
    ),
    Project_screen_items(
        titletext: 'Diwali Kit Event',
        subtitletext:
            "AHHF's Rural Initiative for School Education. Join forces with us in being...",
        image: 'assets/images/project_screen_img2.png'),
    Project_screen_items(
        titletext: 'Care Through Hair',
        subtitletext:
            "AHHF's Rural Initiative for School Education. Join forces with us in being...",
        image: 'assets/images/project_screen_img3.png'),
    Project_screen_items(
        titletext: 'Cloth Donation',
        subtitletext:
            "AHHF's Rural Initiative for School Education. Join forces with us in being...",
        image: 'assets/images/project_screen_img4.png'),
  ];

  List<Project_screen_items> get items {
    return [..._items];
  }

  void addProjectScreenCard() {
    notifyListeners();
  }
}
