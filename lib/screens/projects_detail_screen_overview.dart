// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/app_bar_common.dart';

//put the cards in the gesturedetector

class ProjectsDetailScreenoverview extends StatelessWidget {
  static const String id = '/projects_detail_screen_overview';

  @override
  Widget build(BuildContext context) {
    // final projectId =
    //     ModalRoute.of(context)!.settings.arguments as String; // is the id!
    // ...
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview of the event of the project of project screen'),
      ),
    );
  }
}
