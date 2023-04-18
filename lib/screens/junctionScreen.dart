import 'package:ahhf_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import './loginSignupScreen.dart';
import '../provider/userAuth.dart';

class JunctionScreen extends StatelessWidget {
  static const String id = '/junction-screen';
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
