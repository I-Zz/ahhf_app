
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utilites{
  static String dateformat(String dateTime){


// Assuming you have fetched the date from Firebase and stored it in a variable called 'firebaseDate'
    DateTime date = DateTime.parse(dateTime);
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);

// If the date is today, show how much time has passed since it was uploaded
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      String timeAgo = '';

      if (difference.inSeconds < 60) {
        timeAgo = 'just now';
      } else if (difference.inMinutes < 60) {
        timeAgo = '${difference.inMinutes}m ago';
      } else if (difference.inHours < 24) {
        timeAgo = '${difference.inHours}h ago';
      } else {
        timeAgo = DateFormat('jm').format(date);
      }

      // Display the time since the feed was uploaded
      return timeAgo;
    } else {
      // Display the date when the feed was uploaded
      return DateFormat('dd MMM yyyy').format(date).toString();
    }

  }

}