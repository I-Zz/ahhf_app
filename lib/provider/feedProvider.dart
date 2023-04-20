import 'package:flutter/material.dart';

class FeedTabItems with ChangeNotifier {
  final String image;
  final String title;
  final String description;
  final DateTime time;
  bool likes;
  final String image_text;
  final int liked_count;
  FeedTabItems({
    required this.description,
    required this.time,
    required this.image,
    required this.title,
    this.likes = false,
    required this.image_text,
    required this.liked_count,
  });
}

class FeedTabProvider with ChangeNotifier {
  // for I have mark ProjectDetailsEventTabProvider widget in ProjectDetailsEvent_provider file with
  // changeNotifier

  List<FeedTabItems> _items = [
    FeedTabItems(
      description:
          'The future of India lies in its villages. - Mahatma Gandhi.🙌🏻 AHHF is here with its ‘Tribal and Rural Areas Education Project’. 😍  Stay tuned! ✌🏻Together we can!',
      title: 'AHHF',
      time: DateTime(2023, 2, 15),
      image: 'assets/images/logo.png',
      image_text: 'assets/images/school_children.png',
      liked_count: 29,
    ),
    FeedTabItems(
      description:
          'The future of India lies in its villages. - Mahatma Gandhi.🙌🏻 AHHF is here with its ‘Tribal and Rural Areas Education Project’. 😍  Stay tuned! ✌🏻Together we can!',
      title: 'AHHF',
      time: DateTime(2023, 2, 15),
      image: 'assets/images/logo.png',
      image_text: 'assets/images/school_children.png',
      liked_count: 29,
    ),
    FeedTabItems(
      description:
          'The future of India lies in its villages. - Mahatma Gandhi.🙌🏻 AHHF is here with its ‘Tribal and Rural Areas Education Project’. 😍  Stay tuned! ✌🏻Together we can!',
      title: 'AHHF',
      time: DateTime(2023, 2, 15),
      image: 'assets/images/logo.png',
      image_text: 'assets/images/school_children.png',
      liked_count: 29,
    ),
  ];

  List<FeedTabItems> get items {
    return [..._items];
  }

  void addEventTabItems() {
    notifyListeners();
  }
}
