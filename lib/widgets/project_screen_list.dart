import 'package:ahhf_app/provider/project.dart';
import 'package:flutter/material.dart';
import 'project_screen_cards.dart';
import '../data-models/project_screen_items.dart';
import '../provider/project_screen_provider.dart';
import 'package:provider/provider.dart';

class ProjectScreenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projects = Provider.of<AllProjects>(context).projects;
    final projectdata = Provider.of<Project_screen_provider>(context);
    final projectitems = projectdata.items;
    print(projects[0].title);
    print(projects[0].shortDescription);
    print(projects[0].totalDonation);
    print(projects[0].members);
    print(projects.length);

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      // itemCount: projectitems.length,
      itemCount: projects.length,
      // itemCount: 2,
      itemBuilder: (ctx, i) => ProjectScreenCards(
        projects[i].title,
        projects[i].shortDescription,
        // projectitems[i].titletext,
        // projectitems[i].subtitletext,
        projectitems[i].image,
      ),
    );
    // return ProjectScreenCards('ARISE 2023', 'hello all here',
    //     'assets/images/project_screen_img1.png');
  }
}
