import 'package:ahhf_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import './loginSignupScreen.dart';
import '../provider/userAuth.dart';
import '../provider/project.dart';

class JunctionScreen extends StatefulWidget {
  static const String id = '/junction-screen';

  @override
  State<JunctionScreen> createState() => _JunctionScreenState();
}

class _JunctionScreenState extends State<JunctionScreen> {
  late Future<bool> userExistence;
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;

    Future.delayed(Duration.zero).then((_) {
      Provider.of<CurrentUser>(context, listen: false).setInitialUserData(user);
      Provider.of<AllProjects>(context, listen: false).fetchAndSetupProjects();
      userExistence =
          Provider.of<CurrentUser>(context, listen: false).userExists(user);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          // } else if (snapshot.connectionState == ConnectionState.active) {
          return TabsScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something Went Wrong'),
          );
        } else {
          return Mylogin();
        }
      },
    );
  }
}
