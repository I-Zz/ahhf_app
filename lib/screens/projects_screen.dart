
import 'package:ahhf_app/widgets/project_screen_list.dart';
import 'package:provider/provider.dart';

import '../provider/userAuth.dart';
import 'projects_detail_screen_overview.dart';
import 'package:flutter/material.dart';
import '../widgets/project_screen_cards.dart';
import '../widgets/app_bar_common.dart';

class ProjectScreen extends StatelessWidget {
  static const String id = 'Projectspage';
  @override
  Widget build(BuildContext context) {
    var userName = Provider.of<CurrentUser>(context).getUserName();
    return Scaffold(
      backgroundColor: Color.fromRGBO(166, 166, 166, 0.05),
      //backgroundColor: Colors.black,
      appBar: AppBarCommon(userName, false),

      body: ProjectScreenList(),
    );
  }
}
