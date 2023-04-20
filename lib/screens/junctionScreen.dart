import 'dart:async';

import 'package:ahhf_app/screens/createProfileScreen.dart';
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
  // late Future<bool> userExistence;

  // @override
  // void initState() {
  //   print('init State');

  //   Future.delayed(Duration.zero, () async {
  //     final user = FirebaseAuth.instance.currentUser;
  //     print('a');
  //     await Provider.of<CurrentUser>(context, listen: false)
  //         .setInitialUserData(user);
  //     print('b');
  //     await Provider.of<AllProjects>(context, listen: false)
  //         .fetchAndSetupProjects();
  //     print('c');
  //     // userExistence =
  //     //     Provider.of<CurrentUser>(context, listen: false).userExists(user);
  //   });
  //   super.initState();
  // }

  Future<bool> userExistenceFunction() async {
    final user = FirebaseAuth.instance.currentUser;
    return Provider.of<CurrentUser>(context, listen: false).userExists(user);
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    // Provider.of<CurrentUser>(context, listen: false).setInitialUserData(user);
    // Provider.of<AllProjects>(context, listen: false).fetchAndSetupProjects();
    // userExistence =
    //       Provider.of<CurrentUser>(context, listen: false).userExists(user);

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return CreateOrTabScreen();
          // } else if (snapshot.connectionState == ConnectionState.active) {
          // return FutureBuilder(
          //   future: userExistenceFunction(),
          //   builder: (ctx, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       print('1');
          //       return Center(child: CircularProgressIndicator());
          //     }
          //     // else if (snapshot.hasData) {
          //     //   print('3');
          //     //   bool flag = snapshot.data ?? false;
          //     //   print(flag);
          //     //   return flag ? TabsScreen() : CreateProfileScreen();
          //     // }
          //     else {
          //       print('3');
          //       bool flag = snapshot.data ?? false;
          //       print(flag);
          //       return flag ? TabsScreen() : CreateProfileScreen();
          //     }
          //     // return Center(
          //     //   child: Text('Some error has occurred'),
          //     // );
          //   },
          // );
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

class CreateOrTabScreen extends StatefulWidget {
  @override
  State<CreateOrTabScreen> createState() => _CreateOrTabScreenState();
}

class _CreateOrTabScreenState extends State<CreateOrTabScreen> {

  @override
  void initState() {
    super.initState();
    Future.wait([
      Provider.of<CurrentUser>(context, listen: false)
          .setInitialUserData(FirebaseAuth.instance.currentUser),
      Provider.of<AllProjects>(context, listen: false)
          .fetchAndSetupProjects(),
    ]).then((_) {
      // Both asynchronous operations have completed, so it's safe to render the TabsScreen.
      if (mounted) {
        setState(() {});
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return TabsScreen();
  }
}
