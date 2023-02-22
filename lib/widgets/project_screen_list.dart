import 'package:flutter/material.dart';
import 'project_screen_cards.dart';
import '../data-models/project_screen_items.dart';
import '../provider/project_screen_provider.dart';
import 'package:provider/provider.dart';

class ProjectScreenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectdata = Provider.of<Project_screen_provider>(context);
    final projectitems = projectdata.items;

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: projectitems.length,
      itemBuilder: (ctx, i) => ProjectScreenCards(projectitems[i].titletext,
          projectitems[i].subtitletext, projectitems[i].image),
    );
    // return ProjectScreenCards('ARISE 2023', 'hello all here',
    //     'assets/images/project_screen_img1.png');
  }
}
