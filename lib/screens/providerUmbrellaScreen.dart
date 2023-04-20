import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/project.dart';
import '../provider/userAuth.dart';
import 'package:ahhf_app/screens/junctionScreen.dart';

class ProviderUmbrellaScreen extends StatelessWidget {
  static const String id = '/provider-umbrella-screen';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CurrentUser(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AllProjects(),
        ),
      ],
      child: JunctionScreen(),
    );
  }
}


